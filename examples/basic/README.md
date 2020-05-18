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
>  tf apply
data.aws_vpc.default: Refreshing state...
data.aws_subnet_ids.private: Refreshing state...
module.example.aws_security_group.this: Refreshing state... [id=sg-08e0319d283abc33b]
module.example.aws_security_group_rule.egress: Refreshing state... [id=sgrule-3561702498]
module.example.aws_security_group_rule.ingress[0]: Refreshing state... [id=sgrule-108399677]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.example.aws_elasticache_replication_group.this will be created
  + resource "aws_elasticache_replication_group" "this" {
      + apply_immediately              = false
      + at_rest_encryption_enabled     = false
      + auto_minor_version_upgrade     = true
      + automatic_failover_enabled     = false
      + configuration_endpoint_address = (known after apply)
      + engine                         = "redis"
      + engine_version                 = "4.0.10"
      + id                             = (known after apply)
      + maintenance_window             = (known after apply)
      + member_clusters                = (known after apply)
      + node_type                      = "cache.t2.micro"
      + number_cache_clusters          = 4
      + parameter_group_name           = "default.redis4.0"
      + port                           = 6379
      + primary_endpoint_address       = (known after apply)
      + replication_group_description  = "Replication group for DEFAULT-TEST, managed by terraform"
      + replication_group_id           = "default-test"
      + security_group_ids             = [
          + "sg-08e0319d283abc33b",
        ]
      + security_group_names           = (known after apply)
      + snapshot_window                = (known after apply)
      + subnet_group_name              = "default-test-net"
      + tags                           = {
          + "Name"                  = "DEFAULT-TEST"
          + "terraform_managed"     = "true"
          + "terraform_module"      = "terraform-terraform-tags-1.0.0"
          + "terraform_root_module" = "."
          + "terraform_workspace"   = "default"
        }
      + transit_encryption_enabled     = false

      + cluster_mode {
          + num_node_groups         = (known after apply)
          + replicas_per_node_group = (known after apply)
        }
    }

  # module.example.aws_elasticache_subnet_group.this will be created
  + resource "aws_elasticache_subnet_group" "this" {
      + description = "Managed by Terraform"
      + id          = (known after apply)
      + name        = "default-test-net"
      + subnet_ids  = [
          + "subnet-0212a6e2e57a6139a",
          + "subnet-0b063f0ae19e597da",
        ]
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.example.aws_elasticache_subnet_group.this: Creating...
module.example.aws_elasticache_subnet_group.this: Creation complete after 1s [id=default-test-net]
module.example.aws_elasticache_replication_group.this: Creating...
module.example.aws_elasticache_replication_group.this: Still creating... [10s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [20s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [30s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [40s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [50s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [1m0s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [1m10s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [1m20s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [1m30s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [1m40s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [1m50s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [2m0s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [2m10s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [2m20s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [2m30s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [2m40s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [2m50s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [3m0s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [3m10s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [3m20s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [3m30s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [3m40s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [3m50s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [4m0s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [4m10s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [4m20s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [4m30s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [4m40s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [4m50s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [5m0s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [5m10s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [5m20s elapsed]
module.example.aws_elasticache_replication_group.this: Still creating... [5m30s elapsed]
module.example.aws_elasticache_replication_group.this: Creation complete after 5m37s [id=default-test]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

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
    "id" = "default-test"
    "kms_key_id" = ""
    "maintenance_window" = "sun:07:30-sun:08:30"
    "member_clusters" = [
      "default-test-001",
      "default-test-002",
      "default-test-003",
      "default-test-004",
    ]
    "node_type" = "cache.t2.micro"
    "number_cache_clusters" = 4
    "parameter_group_name" = "default.redis4.0"
    "port" = 6379
    "primary_endpoint_address" = "default-test.miapyb.ng.0001.use1.cache.amazonaws.com"
    "replication_group_description" = "Replication group for DEFAULT-TEST, managed by terraform"
    "replication_group_id" = "default-test"
    "security_group_ids" = [
      "sg-08e0319d283abc33b",
    ]
    "security_group_names" = []
    "snapshot_retention_limit" = 0
    "snapshot_window" = "03:30-04:30"
    "subnet_group_name" = "default-test-net"
    "tags" = {
      "Name" = "DEFAULT-TEST"
      "terraform_managed" = "true"
      "terraform_module" = "terraform-terraform-tags-1.0.0"
      "terraform_root_module" = "."
      "terraform_workspace" = "default"
    }
    "transit_encryption_enabled" = false
  }
  "security_group" = {
    "arn" = "arn:aws:ec2:us-east-1:123456789:security-group/sg-08e0319d283abc33b"
    "description" = "Managed by Terraform"
    "egress" = [
      {
        "cidr_blocks" = [
          "0.0.0.0/0",
        ]
        "description" = "Allow all egress traffic from DEFAULT-TEST"
        "from_port" = 0
        "ipv6_cidr_blocks" = []
        "prefix_list_ids" = []
        "protocol" = "-1"
        "security_groups" = []
        "self" = false
        "to_port" = 0
      },
    ]
    "id" = "sg-08e0319d283abc33b"
    "ingress" = [
      {
        "cidr_blocks" = [
          "0.0.0.0/0",
        ]
        "description" = "Allow tcp ingress to DEFAULT-TEST on port 6379"
        "from_port" = 6379
        "ipv6_cidr_blocks" = []
        "prefix_list_ids" = []
        "protocol" = "tcp"
        "security_groups" = []
        "self" = false
        "to_port" = 6379
      },
    ]
    "name" = "DEFAULT-TEST-SG"
    "owner_id" = "123456789"
    "revoke_rules_on_delete" = false
    "tags" = {
      "Name" = "DEFAULT-TEST-SG"
      "terraform_managed" = "true"
      "terraform_module" = "terraform-terraform-tags-1.0.0"
      "terraform_root_module" = "."
      "terraform_workspace" = "default"
    }
    "vpc_id" = "vpc-123ABC"
  }
}
```
