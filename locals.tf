
locals {
  create_ingress_cidr_sg_rule  = length(var.ingress_rule_cidr_blocks) > 0
  create_route_53_cname_record = var.route53_zone_id != "" && var.dns_cname_record_name != null ? true : false

  engine_version = coalesce(
    var.engine_version,
    var.engine == "memcached" ? "1.5.16" : "4.0.10"
  )

  parameter_group_name = coalesce(
    var.parameter_group_name,
    var.engine == "memcached" ? "default.memcached1.5" : "default.redis4.0"
  )

  port = coalesce(
    var.port,
    var.engine == "memcached" ? 11211 : 6379
  )

  replication_group_description = coalesce(
    var.replication_group_description,
    "Replication group for ${var.name}, managed by terraform"
  )

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}
