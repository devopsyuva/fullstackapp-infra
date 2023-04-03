terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }

  # S3 bucket for storing state file in remote backend
  backend "s3" {
    bucket         = "terraform-visualpathtech"
    key            = "vpc/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "terraform-visualpathtech"
  }
}

provider "aws" {
  # Configuration options
  region  = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::099730796456:role/VisualpathTech"
  }
}