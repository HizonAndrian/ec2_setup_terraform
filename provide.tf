terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.1"
    }
  }

  cloud {
    organization = "Projects_and_deliverables"

    workspaces {
      name = "ec2_setup_terraform"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}