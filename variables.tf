###############################################
# General
###############################################
variable "name" {
  description = "Moniker to apply to all resources in the module"
  type        = string
}

variable "tags" {
  description = "User-Defined tags"
  type        = map(string)
  default     = {}
}

###############################################
# Networking
###############################################
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to make Elasticache available on"
  type        = list(string)
}

variable "ingress_rule_cidr_blocks" {
  description = "List of CIDR blocks that are allowed ingress to ElastiCache"
  type        = list(string)
  default     = []
}

variable "ingress_cidr_sg_rule_description" {
  description = "Description for CIDR-block Ingress rule"
  type        = string
  default     = null
}

variable "ingress_rule_sg" {
  description = "Security Group that is allowed ingress to ElastiCache"
  type        = string
  default     = null
}

variable "ingress_sg_sg_rule_description" {
  description = "Description for Security Group Ingress rule"
  type        = string
  default     = null
}

###############################################
# ElastiCache-Specific
###############################################
variable "port" {
  description = "Elasticache port"
  type        = number
  default     = 6379
}

variable "engine_version" {
  description = "Elasticache engine version"
  type        = string
  default     = "4.0.10"
}

variable "instance_type" {
  description = "Type of ec2 instance for elasticache"
  type        = string
  default     = "cache.t2.micro"
}

variable "cluster_size" {
  description = "Number of nodes in Elasticache cluster"
  type        = number
  default     = 4
}

variable "parameter_group_name" {
  description = "Elasticache parameter group name"
  type        = string
  default     = "default.redis4.0"
}

variable "availability_zones" {
  description = "List of EC2 availability zones in which the replication group's cache clusters will be created"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "replication_group_description" {
  description = "Description for ElastiCache Replication Group"
  type        = string
  default     = null
}

variable "apply_immediately" {
  default     = false
  type        = bool
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window"
}

variable "auto_minor_version_upgrade" {
  description = "Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window."
  type        = bool
  default     = true
}

variable "maintenance_window" {
  type        = string
  default     = "sun:03:00-sun:04:00"
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"
}

variable "notification_topic_arn" {
  type        = string
  default     = null
  description = "An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic"
}

variable "snapshot_window" {
  description = "(Optional, Redis only) The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period. Example: 05:00-09:00"
  type        = string
  default     = "02:00-03:00"
}
