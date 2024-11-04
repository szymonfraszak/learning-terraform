terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# provider definition
provider "aws" {
  region  = "us-west-2"
}
