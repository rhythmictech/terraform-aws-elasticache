# terraform-aws-elasticache
Terraform ElastiCache Module: Simple and Sensibly Opinionated

[![tflint](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/tflint/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Atflint+event%3Apush+branch%3Amain)
[![tfsec](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/tfsec/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amain)
[![yamllint](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/yamllint/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amain)
[![misspell](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/misspell/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amain)
[![pre-commit-check](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/pre-commit-check/badge.svg?branch=main&event=push)](https://github.com/rhythmictech/terraform-aws-elasticache/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amain)
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
| terraform | >= 0.12.14 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Moniker to apply to all resources in the module | `string` | n/a | yes |
| subnet\_ids | List of subnet IDs to make Elasticache available on | `list(string)` | n/a | yes |
| vpc\_id | VPC ID | `string` | n/a | yes |
| apply\_immediately | Specifies whether any modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| auto\_minor\_version\_upgrade | Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. | `bool` | `true` | no |
| availability\_zones | List of EC2 availability zones in which the replication group's cache clusters will be created | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| cluster\_size | Number of nodes in Elasticache cluster | `number` | `4` | no |
| dns\_cname\_record\_name | The name of the record, eg test.example.com. Must be specified with `route53_zone_id` | `string` | `null` | no |
| egress\_security\_group\_rule\_description | Description for Egress rule | `string` | `null` | no |
| engine\_version | Elasticache engine version | `string` | `"4.0.10"` | no |
| ingress\_cidr\_sg\_rule\_description | Description for CIDR-block Ingress rule | `string` | `null` | no |
| ingress\_rule\_cidr\_blocks | List of CIDR blocks that are allowed ingress to ElastiCache | `list(string)` | `[]` | no |
| ingress\_sg\_sg\_rule\_description | Description for Security Group Ingress rule | `string` | `null` | no |
| instance\_type | Type of ec2 instance for elasticache | `string` | `"cache.t2.micro"` | no |
| maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00 | `string` | `"sun:03:00-sun:04:00"` | no |
| notification\_topic\_arn | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my\_sns\_topic | `string` | `null` | no |
| parameter\_group\_name | Elasticache parameter group name | `string` | `"default.redis4.0"` | no |
| port | Elasticache port | `number` | `6379` | no |
| replication\_group\_description | Description for ElastiCache Replication Group | `string` | `null` | no |
| route53\_zone\_id | The ID of the hosted zone to contain this record. | `string` | `""` | no |
| security\_group\_ids | Security Groups that are allowed ingress to ElastiCache | `set(string)` | `[]` | no |
| snapshot\_window | (Optional, Redis only) The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period. Example: 05:00-09:00 | `string` | `"02:00-03:00"` | no |
| tags | User-Defined tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| elasticache\_fqdn | Fully Qualified Domain Name of Elasticache: the endpoint or the CNAME if used |
| elasticache\_replication\_group | elasticache\_replication\_group resource |
| elasticache\_route53\_record | aws route53 record resource |
| security\_group | aws\_security\_group resource |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants underneath this module
- pre-commit.com/
- www.terraform.io/
- github.com/tfutils/tfenv
- github.com/segmentio/terraform-docs
