
provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.default.id
}

variable "dns_cname_record_name" {
  description = "Your new DNS name for elasticache"
  type        = string
}

variable "route53_zone_id" {
  description = "Zone ID of your Route 53 Zone"
  type        = string
}

module "example" {
  source = "../.."

  dns_cname_record_name = var.dns_cname_record_name
  name                  = "test"
  route53_zone_id       = var.route53_zone_id
  subnet_ids            = data.aws_subnet_ids.private.ids
  vpc_id                = data.aws_vpc.default.id
}

output "example" {
  value = module.example
}
