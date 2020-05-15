# terraform-aws-elasticache [![pre-commit-check](https://github.com/rhythmictech/terraform-aws-elasticache/workflows/pre-commit-check/badge.svg)](https://github.com/rhythmictech/terraform-aws-elasticache/actions) <a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=RhythmicTech" alt="follow on Twitter"></a>
Terraform ElastiCache Module: Simple and Sensibly Opinionated



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

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | List of EC2 availability zones in which the replication group's cache clusters will be created | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| cluster\_size | Number of nodes in Elasticache cluster | `number` | `4` | no |
| engine\_version | Elasticache engine version | `string` | `"4.0.10"` | no |
| env | Environment to tag resources with | `string` | `"default"` | no |
| ingresss\_rules | List of ports to allow ingress on | <pre>list(object({<br>    port        = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "port": 6379,<br>    "protocol": "tcp"<br>  }<br>]</pre> | no |
| instance\_type | Type of ec2 instance for elasticache | `string` | `"cache.t2.micro"` | no |
| name | Moniker to apply to all resources in the module | `string` | n/a | yes |
| parameter\_group\_name | Elasticache parameter group name | `string` | `"default.redis4.0"` | no |
| port | Elasticache port | `number` | `6379` | no |
| subnets\_ids | List of subnet IDs to make Elasticache available on | `list(string)` | `[]` | no |
| tags | User-Defined tags | `map(string)` | `{}` | no |
| vpc\_id | VPC ID | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## The Giants underneath this module
- pre-commit.com/
- www.terraform.io/
- github.com/tfutils/tfenv
- github.com/segmentio/terraform-docs
