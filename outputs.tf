###############################################
# General Outputs
###############################################

output "elasticache_fqdn" {
  description = "Fully Qualified Domain Name of Elasticache: the endpoint or the CNAME if used"
  value       = try(aws_route53_record.elasticache[0].fqdn, local.elasticache_address)
}

output "elasticache_cluster_id" {
  description = "ElastiCache cluster ID"
  value       = try(aws_elasticache_cluster.this[0].id, null)
}

output "elasticache_replication_group_id" {
  description = "elasticache_replication_group resource"
  value       = try(aws_elasticache_replication_group.this[0].id, null)
}

output "elasticache_route53_record_id" {
  description = "aws route53 record resource"
  value       = try(aws_route53_record.elasticache[0].id, null)
}

output "security_group_id" {
  description = "aws_security_group resource"
  value       = try(aws_security_group.this[0].id, null)
}
