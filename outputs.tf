###############################################
# General
###############################################
output "security_group" {
  description = "aws_security_group resource"
  value       = aws_security_group.this
}

output "elasticache_replication_group" {
  description = "elasticache_replication_group resource"
  value       = elasticache_replication_group.this
}
