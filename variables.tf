
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

variable "env" {
  description = "Environment to tag resources with"
  type        = string
  default     = "default"
}

###############################################
# Networking
###############################################
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnets_ids" {
  description = "List of subnet IDs to make Elasticache available on"
  type        = list(string)
  default     = []
}

variable "ingresss_rules" {
  description = "List of ports to allow ingress on"
  type = list(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    port        = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
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
