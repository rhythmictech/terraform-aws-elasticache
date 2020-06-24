
locals {
  create_ingress_cidr_sg_rule            = length(var.ingress_rule_cidr_blocks) > 0
  create_route_53_cname_record           = var.route53_zone_id != "" && var.dns_cname_record_name != null ? true : false
  egress_security_group_rule_description = var.egress_security_group_rule_description
  ingress_cidr_sg_rule_description       = var.ingress_cidr_sg_rule_description
  ingress_sg_sg_rule_description         = var.ingress_sg_sg_rule_description
  replication_group_description          = coalesce(var.replication_group_description, "Replication group for ${var.name}, managed by terraform")
  tags                                   = var.tags
}
