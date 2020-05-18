# basic example
A basic example for this repository

## Code
```terraform
# examples/basic/main.tf
provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.default.id
}

module "example" {
  source = "../.."

  name       = "test"
  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnet_ids.private.ids
}

output "example" {
  value = module.example
}
```

## Apply
This example has been slightly redacted to perserve anonymity.

```
> tf outputs
Outputs:

example = {
  "elasticache_replication_group" = {
    "apply_immediately" = false
    "at_rest_encryption_enabled" = false
    "auth_token" = ""
    "auto_minor_version_upgrade" = true
    "automatic_failover_enabled" = false
    "cluster_mode" = []
    "engine" = "redis"
    "engine_version" = "4.0.10"
    "id" = "test"
    "kms_key_id" = ""
    "maintenance_window" = "sun:03:00-sun:04:00"
    "member_clusters" = [
      "test-001",
      "test-002",
      "test-003",
      "test-004",
    ]
    "node_type" = "cache.t2.micro"
    "number_cache_clusters" = 4
    "parameter_group_name" = "default.redis4.0"
    "port" = 6379
    "primary_endpoint_address" = "test.miapyb.ng.0001.use1.cache.amazonaws.com"
    "replication_group_description" = "Replication group for TEST, managed by terraform"
    "replication_group_id" = "test"
    "security_group_ids" = [
      "sg-053a16531380220d1",
    ]
    "security_group_names" = []
    "snapshot_retention_limit" = 0
    "snapshot_window" = "02:00-03:00"
    "subnet_group_name" = "test-net"
    "tags" = {
      "Name" = "TEST"
      "terraform_managed" = "true"
      "terraform_module" = "terraform-terraform-tags-1.0.0"
      "terraform_root_module" = "."
      "terraform_workspace" = "default"
    }
    "transit_encryption_enabled" = false
  }
  "security_group" = {
    "arn" = "arn:aws:ec2:us-east-1:123456789:security-group/sg-053a16531380220d1"
    "description" = "Managed by Terraform"
    "egress" = [
      {
        "cidr_blocks" = [
          "0.0.0.0/0",
        ]
        "description" = ""
        "from_port" = 0
        "ipv6_cidr_blocks" = []
        "prefix_list_ids" = []
        "protocol" = "-1"
        "security_groups" = []
        "self" = false
        "to_port" = 0
      },
    ]
    "id" = "sg-053a16531380220d1"
    "ingress" = []
    "name" = "TEST-SG"
    "owner_id" = "123456789"
    "revoke_rules_on_delete" = false
    "tags" = {
      "Name" = "TEST-SG"
      "terraform_managed" = "true"
      "terraform_module" = "terraform-terraform-tags-1.0.0"
      "terraform_root_module" = "."
      "terraform_workspace" = "default"
    }
    "vpc_id" = "vpc-123456789"
  }
}
```
