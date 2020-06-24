
###############################################
# Security & Networking
###############################################
resource "aws_security_group" "this" {
  name_prefix = "${var.name}-"
  description = "Security group for ${var.name} Elasticache cluster"
  tags        = local.tags
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "egress" {
  description       = var.egress_security_group_rule_description
  cidr_blocks       = ["0.0.0.0/0"] #tfsec:ignore:AWS007
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.this.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "ingress_cidr" {
  count             = local.create_ingress_cidr_sg_rule ? 1 : 0
  cidr_blocks       = var.ingress_rule_cidr_blocks
  description       = var.ingress_cidr_sg_rule_description
  from_port         = var.port
  protocol          = "tcp"
  security_group_id = aws_security_group.this.id
  to_port           = var.port
  type              = "ingress"
}

resource "aws_security_group_rule" "ingress_sg" {
  cidr_blocks       = each.value
  description       = var.ingress_sg_sg_rule_description
  for_each          = var.security_group_ids
  from_port         = var.port
  protocol          = "tcp"
  security_group_id = aws_security_group.this.id
  to_port           = var.port
  type              = "ingress"
}

resource "aws_elasticache_subnet_group" "this" {
  name       = var.name
  subnet_ids = var.subnet_ids
}

###############################################
# Elasticache
###############################################
resource "aws_elasticache_replication_group" "this" {
  apply_immediately             = var.apply_immediately
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  engine_version                = var.engine_version
  maintenance_window            = var.maintenance_window
  node_type                     = var.instance_type
  notification_topic_arn        = var.notification_topic_arn
  number_cache_clusters         = var.cluster_size
  parameter_group_name          = var.parameter_group_name
  port                          = var.port
  replication_group_description = local.replication_group_description
  replication_group_id          = var.name
  security_group_ids            = [aws_security_group.this.id]
  snapshot_window               = var.snapshot_window
  subnet_group_name             = aws_elasticache_subnet_group.this.name
  tags                          = local.tags
}

###############################################
# DNS
###############################################
resource "aws_route53_record" "elasticache" {
  count   = local.create_route_53_cname_record ? 1 : 0
  name    = var.dns_cname_record_name
  records = [aws_elasticache_replication_group.this.primary_endpoint_address]
  type    = "CNAME"
  ttl     = "300"
  zone_id = var.route53_zone_id
}
