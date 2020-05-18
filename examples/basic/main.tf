
provider "aws" {
  region = "us-east-1"
}

module "example" {
  source = "../.."

  name   = "test"
  vpc_id = "vpc-8108b1fb"
}

output "example" {
  value = module.example
}
