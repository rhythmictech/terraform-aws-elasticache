# create_route_53_cname_record example
An example for this repository which puts the elasticache instance behind a DNS record

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

variable "route53_zone_id" {
  description = "Zone ID of your Route 53 Zone"
  type        = string
}

module "example" {
  source = "../.."

  name            = "test"
  route53_zone_id = var.route53_zone_id
  subnet_ids      = data.aws_subnet_ids.private.ids
  vpc_id          = data.aws_vpc.default.id
}

output "example" {
  value = module.example
}

```

## Apply
This example has been slightly redacted to perserve anonymity.

```
Outputs:

example = {
  "elasticache_replication_group" = {
    "apply_immediately" = false
    ...
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
    "primary_endpoint_address" = "test.jrbhns.ng.0001.use1.cache.amazonaws.com"
    "replication_group_description" = "Replication group for test, managed by terraform"
    "replication_group_id" = "test"
    "security_group_ids" = [
      "sg-02b38a36853d3b621",
    ]
    "security_group_names" = []
    "snapshot_retention_limit" = 0
    "snapshot_window" = "02:00-03:00"
    "subnet_group_name" = "test-net"
    "tags" = {
      "Name" = "test"
    }
    "transit_encryption_enabled" = false
  }
  "elasticache_route53_record" = {
    "alias" = []
    "failover_routing_policy" = []
    "fqdn" = "test.stage.oforce.com"
    "geolocation_routing_policy" = []
    "health_check_id" = ""
    "id" = "123456789_test_CNAME"
    "latency_routing_policy" = []
    "name" = "test"
    "records" = [
      "test.jrbhns.ng.0001.use1.cache.amazonaws.com",
    ]
    "set_identifier" = ""
    "ttl" = 300
    "type" = "CNAME"
    "weighted_routing_policy" = []
    "zone_id" = "123456789"
  }
  "security_group" = {
    "arn" = "arn:aws:ec2:us-east-1:123456789:security-group/sg-02b38a36853d3b621"
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
    "id" = "sg-02b38a36853d3b621"
    "ingress" = []
    "name" = "test-SG"
    "owner_id" = "123456789"
    "revoke_rules_on_delete" = false
    "tags" = {
      "Name" = "test-SG"
    }
    "vpc_id" = "vpc-8108b1fb"
  }
}
```
