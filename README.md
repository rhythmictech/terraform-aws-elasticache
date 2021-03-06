# terraform-aws-elasticache
Terraform ElastiCache Module: Simple and Sensibly Opinionated

[![tflint](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/tflint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Atflint+event%3Apush+branch%3Amaster)
[![tfsec](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/tfsec/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amaster)
[![yamllint](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/yamllint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amaster)
[![misspell](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/misspell/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amaster)
[![pre-commit-check](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/pre-commit-check/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amaster)
<a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=RhythmicTech" alt="follow on Twitter"></a>


## Example
Here's what using the module will look like
```terraform
module "example" {
  source  = "rhythmictech/terraform-aws-elasticache"
  version = "0.0.1
}
```

## About
aws.amazon.com/elasticache/

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| aws | >= 2.49 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.49 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Moniker to apply to all resources in the module | `string` | n/a | yes |
| subnet\_ids | List of subnet IDs to make Elasticache available on | `list(string)` | n/a | yes |
| vpc\_id | VPC ID to create cluster in | `string` | n/a | yes |
| apply\_immediately | Specifies whether any modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| auto\_minor\_version\_upgrade | Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. | `bool` | `true` | no |
| cluster\_size | Number of nodes in Elasticache cluster | `number` | `4` | no |
| create | If false, this module does nothing | `bool` | `true` | no |
| dns\_cname\_record\_name | The name of the record, eg test.example.com. Must be specified with `route53_zone_id` | `string` | `null` | no |
| egress\_security\_group\_rule\_description | Description for Egress rule | `string` | `null` | no |
| engine | memcached or redis | `string` | `"redis"` | no |
| engine\_version | Elasticache engine version | `string` | `null` | no |
| ingress\_cidr\_sg\_rule\_description | Description for CIDR-block Ingress rule | `string` | `null` | no |
| ingress\_rule\_cidr\_blocks | List of CIDR blocks that are allowed ingress to ElastiCache | `list(string)` | `[]` | no |
| ingress\_sg\_sg\_rule\_description | Description for Security Group Ingress rule | `string` | `null` | no |
| instance\_type | Type of ec2 instance for elasticache | `string` | `"cache.t2.micro"` | no |
| maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00 | `string` | `"sun:03:00-sun:04:00"` | no |
| notification\_topic\_arn | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my\_sns\_topic | `string` | `null` | no |
| parameter\_group\_name | Elasticache parameter group name | `string` | `null` | no |
| port | Elasticache port | `number` | `null` | no |
| replication\_group\_description | Description for ElastiCache Replication Group | `string` | `null` | no |
| route53\_zone\_id | The ID of the hosted zone to contain this record. | `string` | `""` | no |
| security\_group\_ids | Security Groups that are allowed ingress to ElastiCache | `list(string)` | `[]` | no |
| snapshot\_window | (Optional, Redis only) The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period. Example: 05:00-09:00 | `string` | `"02:00-03:00"` | no |
| tags | User-Defined tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_address | (Memcached only) The DNS name of the cache cluster without the port appended. |
| elasticache\_cluster\_id | ElastiCache cluster ID |
| elasticache\_fqdn | Fully Qualified Domain Name of Elasticache: the endpoint or the CNAME if used |
| elasticache\_replication\_group\_id | elasticache\_replication\_group resource |
| elasticache\_route53\_record\_id | aws route53 record resource |
| primary\_endpoint\_address | (Redis only) The address of the endpoint for the primary node in the replication group, if the cluster mode is disabled. |
| security\_group\_id | aws\_security\_group resource |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants underneath this module
- pre-commit.com/
- www.terraform.io/
- github.com/tfutils/tfenv
- github.com/segmentio/terraform-docs
