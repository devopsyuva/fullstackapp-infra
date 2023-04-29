variable "aws_region" {
  description = "Region on which to host Visualpath Tech application"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_network" {
  description = "VPC network CIDR for Visualpath Tech application"
  type        = string
  default     = "192.168.0.0/16"
}

locals {
  public_subnets = {
    "${var.aws_region}a" = "192.168.0.0/24"
    "${var.aws_region}b" = "192.168.2.0/24"
    "${var.aws_region}c" = "192.168.4.0/24"
  }
  private_subnets = {
    "${var.aws_region}a" = "192.168.1.0/24"
    "${var.aws_region}b" = "192.168.3.0/24"
    "${var.aws_region}c" = "192.168.5.0/24"
  }
}

locals {
  common_tags = {
    Environment = "Production",
    type        = "Fullstack"
  }
}