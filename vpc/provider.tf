terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "visualpathtech"
  region  = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::099730796456:role/VisualpathTech"
  }
}