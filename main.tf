
###############################################
# General
###############################################
module "tags" {
  source  = "rhythmictech/tags/terraform"
  version = "1.0.0"

  enforce_case = "UPPER"
  tags         = var.tags
  names = [
    var.env,
    var.name
  ]
}

###############################################
# Security Groups
###############################################
resource "aws_security_group" "this" {
  name   = local.security_group_name
  vpc_id = var.vpc_id
  tags = merge(module.label.tags, {
    Name = local.security_group_name
  })
}

resource "aws_security_group_rule" "egress" {
  name              = local.security_group_egress_rule_name
  description       = "Allow all egress traffic from ${local.name}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.this.id
  type              = "egress"
}

resource "aws_security_group_rule" "ingress" {
  for_each = var.ingress_rules

  name              = "${local.security_group_ingress_rule_name_prefix}-${ingress.value.port}"
  description       = "Allow ${ingress.value.protocol} ingress to ${local.name} on port ${ingress.value.port}"
  from_port         = ingress.value.port
  to_port           = ingress.value.port
  protocol          = ingress.value.protocol
  cidr_blocks       = ingress.value.cidr_blocks
  security_group_id = aws_security_group.this.this.id
  type              = "ingress"
}

resource "aws_elasticache_subnet_group" "this" {
  name       = local.subnet_group_name
  subnet_ids = var.subnet_ids
}

###############################################
# Elasticache
###############################################

resource "aws_elasticache_replication_group" "this" {

  replication_group_id          = module.tags.id
  replication_group_description = module.label.id

  engine_version        = var.engine_version
  node_type             = var.instance_type
  number_cache_clusters = var.cluster_size
  port                  = var.port
  parameter_group_name  = var.parameter_group_name

  automatic_failover_enabled = var.automatic_failover_enabled
  subnet_group_name          = local.elasticache_subnet_group_name
  security_group_ids         = var.use_existing_security_groups ? var.existing_security_groups : [join("", aws_security_group.default.*.id)]
  maintenance_window         = var.maintenance_window
  notification_topic_arn     = var.notification_topic_arn
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  snapshot_window            = var.snapshot_window
  snapshot_retention_limit   = var.snapshot_retention_limit
  apply_immediately          = var.apply_immediately

  tags = module.tags.tags
}
