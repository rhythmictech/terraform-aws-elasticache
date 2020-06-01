###############################################
# General
###############################################
output "security_group" {
  description = "aws_security_group resource"
  value       = aws_security_group.this
}

output "elasticache_replication_group" {
  description = "elasticache_replication_group resource"
  value       = aws_elasticache_replication_group.this
}

output "elasticache_route53_record" {
  description = "aws route53 record resource"
  value       = try(aws_route53_record.elasticache[0], {})
}

output "elasticache_fqdn" {
  description = "Fully Qualified Domain Name of Elasticache: the endpoint or the CNAME if used"
  value       = try(aws_route53_record.elasticache[0].fqdn, aws_elasticache_replication_group.this.primary_endpoint_address)
}
