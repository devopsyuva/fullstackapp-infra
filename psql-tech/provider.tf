terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }

  # S3 bucket for storing state file in remote backend
  backend "s3" {
    bucket         = "visualpath-terraform-manifests"
    key            = "production/psql/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-visualpathtech"
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}