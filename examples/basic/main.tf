
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
  subnet_ids = data.aws_subnet_ids.private.ids
  vpc_id     = data.aws_vpc.default.id
}

output "example" {
  value = module.example
}
