
locals {
  name                                   = module.tags.name
  security_group_name                    = "${local.name}-SG"
  subnet_group_name                      = "${local.name}-NET"
  egress_security_group_rule_description = "Allow all egress traffic from ${local.name}"
  replication_group_description          = coalesce(var.replication_group_description, "Replication group for ${local.name}, managed by terraform")
}
