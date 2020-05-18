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

  tags = merge(module.tags.tags, {
    Name = local.security_group_name
  })
}

resource "aws_security_group_rule" "egress" {
  description       = local.egress_security_group_rule_description
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
  type              = "egress"
}

resource "aws_security_group_rule" "ingress_cidr" {
  description       = local.ingress_cidr_sg_rule_description
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  cidr_blocks       = var.ingress_rule_cidr_blocks
  security_group_id = aws_security_group.this.id
  type              = "ingress"
}

resource "aws_security_group_rule" "ingress_sg" {
  description       = local.ingress_sg_sg_rule_description
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  cidr_blocks       = var.ingress_rule_sg
  security_group_id = aws_security_group.this.id
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

  replication_group_id          = local.name
  replication_group_description = local.replication_group_description

  engine_version        = var.engine_version
  node_type             = var.instance_type
  number_cache_clusters = var.cluster_size
  port                  = var.port
  parameter_group_name  = var.parameter_group_name

  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  subnet_group_name          = aws_elasticache_subnet_group.this.name
  security_group_ids         = [aws_security_group.this.id]
  apply_immediately          = var.apply_immediately

  tags = module.tags.tags
}
