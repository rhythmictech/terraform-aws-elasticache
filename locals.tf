
locals {
  name                                    = module.tags.id
  security_group_name                     = "${local.name}-SG"
  security_group_egress_rule_name         = "${local.name}-SG-EGRESS"
  security_group_ingress_rule_name_prefix = "${local.name}-SG-INGRESS"
  subnet_group_name                       = "${local.name}-NET"

}
