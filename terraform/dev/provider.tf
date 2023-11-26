provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket         = "oozou-devops-dev-tf-state"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.55"
    }
  }
}
