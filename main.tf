###############################################
# Security & Networking
###############################################
resource "aws_security_group" "this" {
  count = var.create ? 1 : 0

  name_prefix = var.name
  description = "Security group for ${var.name} Elasticache cluster"
  tags        = local.tags
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "egress" {
  count = var.create ? 1 : 0

  cidr_blocks       = ["0.0.0.0/0"] #tfsec:ignore:AWS007
  description       = var.egress_security_group_rule_description
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.this[0].id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "ingress_cidr" {
  count = local.create_ingress_cidr_sg_rule ? 1 : 0

  cidr_blocks       = var.ingress_rule_cidr_blocks
  description       = var.ingress_cidr_sg_rule_description
  from_port         = local.port
  protocol          = "tcp"
  security_group_id = aws_security_group.this[0].id
  to_port           = local.port
  type              = "ingress"
}

resource "aws_security_group_rule" "ingress_sg" {
  count = local.create_ingress_sg_sg_rule ? length(var.security_group_ids) : 0

  description              = var.ingress_sg_sg_rule_description
  from_port                = local.port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.this[0].id
  source_security_group_id = var.security_group_ids[count.index]
  to_port                  = local.port
  type                     = "ingress"
}

resource "aws_elasticache_subnet_group" "this" {
  count = var.create ? 1 : 0

  name       = var.name
  subnet_ids = var.subnet_ids
}

###############################################
# Elasticache
###############################################

# Use replication_group for Redis
resource "aws_elasticache_replication_group" "this" {
  count = local.create_replication_group ? 1 : 0

  replication_group_id = var.name

  apply_immediately             = var.apply_immediately
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  engine_version                = local.engine_version
  maintenance_window            = var.maintenance_window
  node_type                     = var.instance_type
  notification_topic_arn        = var.notification_topic_arn
  number_cache_clusters         = var.cluster_size
  parameter_group_name          = local.parameter_group_name
  port                          = local.port
  replication_group_description = local.replication_group_description
  security_group_ids            = try([aws_security_group.this[0].id], [])
  snapshot_window               = var.snapshot_window
  subnet_group_name             = try(aws_elasticache_subnet_group.this[0].name, "")
  tags                          = local.tags
  dynamic "log_delivery_configuration" {
    for_each = var.log_delivery_configuration
    content {
      destination      = log_delivery_configuration.value["destination"]
      destination_type = log_delivery_configuration.value["destination_type"]
      log_format       = log_delivery_configuration.value["log_format"]
      log_type         = log_delivery_configuration.value["log_type"]
    }
  }
}

# Use cluster for Memcached
resource "aws_elasticache_cluster" "this" {
  count = local.create_cluster ? 1 : 0

  cluster_id = var.name

  apply_immediately      = var.apply_immediately
  az_mode                = var.cluster_size > 1 ? "cross-az" : "single-az"
  engine                 = var.engine
  engine_version         = local.engine_version
  maintenance_window     = var.maintenance_window
  node_type              = var.instance_type
  notification_topic_arn = var.notification_topic_arn
  num_cache_nodes        = var.cluster_size
  parameter_group_name   = local.parameter_group_name
  port                   = local.port
  security_group_ids     = [aws_security_group.this[0].id]
  subnet_group_name      = aws_elasticache_subnet_group.this[0].name
  tags                   = local.tags

  dynamic "log_delivery_configuration" {
    for_each = var.log_delivery_configuration
    content {
      destination      = log_delivery_configuration.value["destination"]
      destination_type = log_delivery_configuration.value["destination_type"]
      log_format       = log_delivery_configuration.value["log_format"]
      log_type         = log_delivery_configuration.value["log_type"]
    }
  }
}

###############################################
# DNS
###############################################

locals {
  elasticache_address = try(
    aws_elasticache_replication_group.this[0].primary_endpoint_address,
    aws_elasticache_cluster.this[0].cluster_address,
    ""
  )
}

resource "aws_route53_record" "elasticache" {
  count   = local.create_route_53_cname_record ? 1 : 0
  name    = var.dns_cname_record_name
  records = [local.elasticache_address]
  type    = "CNAME"
  ttl     = "300"
  zone_id = var.route53_zone_id
}
