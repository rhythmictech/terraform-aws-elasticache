
locals {
  name                                   = module.tags.name
  tags                                   = module.tags.tags_no_name
  security_group_name                    = "${local.name}-SG"
  subnet_group_name                      = "${local.name}-NET"
  egress_security_group_rule_description = var.egress_security_group_rule_description
  ingress_cidr_sg_rule_description       = var.ingress_cidr_sg_rule_description
  ingress_sg_sg_rule_description         = var.ingress_sg_sg_rule_description
  replication_group_description          = var.replication_group_description
}
