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
