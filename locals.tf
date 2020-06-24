
locals {
  create_ingress_cidr_sg_rule   = length(var.ingress_rule_cidr_blocks) > 0
  create_route_53_cname_record  = var.route53_zone_id != "" && var.dns_cname_record_name != null ? true : false
  replication_group_description = coalesce(var.replication_group_description, "Replication group for ${var.name}, managed by terraform")

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}
