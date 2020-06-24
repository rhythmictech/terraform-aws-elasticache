variable "apply_immediately" {
  default     = false
  type        = bool
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window"
}

variable "auto_minor_version_upgrade" {
  default     = true
  description = "Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window."
  type        = bool
}

variable "cluster_size" {
  default     = 4
  description = "Number of nodes in Elasticache cluster"
  type        = number
}

variable "dns_cname_record_name" {
  default     = null
  description = " The name of the record, eg test.example.com. Must be specified with `route53_zone_id`"
  type        = string
}

variable "egress_security_group_rule_description" {
  default     = null
  description = "Description for Egress rule"
  type        = string
}

variable "engine_version" {
  default     = "4.0.10"
  description = "Elasticache engine version"
  type        = string
}

variable "ingress_cidr_sg_rule_description" {
  default     = null
  description = "Description for CIDR-block Ingress rule"
  type        = string
}

variable "ingress_rule_cidr_blocks" {
  default     = []
  description = "List of CIDR blocks that are allowed ingress to ElastiCache"
  type        = list(string)
}

variable "ingress_sg_sg_rule_description" {
  default     = null
  description = "Description for Security Group Ingress rule"
  type        = string
}

variable "instance_type" {
  default     = "cache.t2.micro"
  description = "Type of ec2 instance for elasticache"
  type        = string
}

variable "maintenance_window" {
  default     = "sun:03:00-sun:04:00"
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"
  type        = string
}

variable "name" {
  description = "Moniker to apply to all resources in the module"
  type        = string
}

variable "notification_topic_arn" {
  default     = null
  description = "An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic"
  type        = string
}

variable "parameter_group_name" {
  default     = "default.redis4.0"
  description = "Elasticache parameter group name"
  type        = string
}

variable "port" {
  default     = 6379
  description = "Elasticache port"
  type        = number
}

variable "replication_group_description" {
  default     = null
  description = "Description for ElastiCache Replication Group"
  type        = string
}

variable "route53_zone_id" {
  default     = ""
  description = "The ID of the hosted zone to contain this record."
  type        = string
}

variable "security_group_ids" {
  default     = []
  description = "Security Groups that are allowed ingress to ElastiCache"
  type        = set(string)
}

variable "snapshot_window" {
  default     = "02:00-03:00"
  description = "(Optional, Redis only) The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period. Example: 05:00-09:00"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to make Elasticache available on"
  type        = list(string)
}

variable "tags" {
  default     = {}
  description = "User-Defined tags"
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
