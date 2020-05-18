
locals {
  name                                   = module.tags.name
  tags                                   = module.tags.tags_no_name
  security_group_name                    = "${local.name}-SG"
  subnet_group_name                      = "${local.name}-NET"
  egress_security_group_rule_description = "Allow all egress traffic from ${local.name}"
  ingress_cidr_sg_rule_description       = "Allow tcp ingress to ${local.name} on port ${var.port} from CIDR blocks: ${join(", ", var.ingress_rule_cidr_blocks)}"
  ingress_sg_sg_rule_description         = "Allow tcp ingress to ${local.name} on port ${var.port} from Security Groups: ${join(", ", var.ingress_rule_cidr_blocks)}"
  replication_group_description          = coalesce(var.replication_group_description, "Replication group for ${local.name}, managed by terraform")
}
