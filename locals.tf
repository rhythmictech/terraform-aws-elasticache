
locals {
  create_ingress_cidr_sg_rule            = length(var.ingress_rule_cidr_blocks) > 0
  egress_security_group_rule_description = var.egress_security_group_rule_description
  ingress_cidr_sg_rule_description       = var.ingress_cidr_sg_rule_description
  ingress_sg_sg_rule_description         = var.ingress_sg_sg_rule_description
  name                                   = var.tags
  replication_group_description          = coalesce(var.replication_group_description, "Replication group for ${local.name}, managed by terraform")
  security_group_name                    = "${local.name}-SG"
  subnet_group_name                      = "${local.name}-NET"
  tags                                   = var.tags
}
