
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
