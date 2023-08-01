terraform {
  required_version = ">= 0.12.20" # try() was introduced in 0.12.20

  required_providers {
    aws = ">= 2.49, < 5"
  }
}
