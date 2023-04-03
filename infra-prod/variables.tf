variable "aws_region" {
  description = "Region on which to host Visualpath Tech application"
  type        = string
  default     = "ap-south-2"
}

variable "template_name" {
  description = "Provide name that to be assigned launch template"
  type        = string
  default     = "visualpathtech-ReactJS"
}

variable "visualtech_launch_type" {
  description = "Launch type to allocate resources for ASG instances"
  type        = string
  default     = "t3.medium"
}

variable "app_keypair" {
  description = "Keypair name assign EC2 instance, not managed through Terraform"
  type        = string
  default     = "VisualpathTech"
}

variable "alb_name" {
  description = "Provide name that to be assigned for Frontend ALB"
  type        = string
  default     = "VisualpathTech-ReactJS-alb"
}

variable "alb_targetgroup_name" {
  description = "Provide ALB target group name"
  type        = string
  default     = "Techtg"
}

variable "alb_sg_name" {
  description = "Provide name to ALB security group"
  type        = string
  default     = "VisualpathTech-ALB-sg"
}

variable "app_sg_name" {
  description = "Provide name to EC2 attached security groups through ASG"
  type        = string
  default     = "VisualpathTech-APP-sg"
}

locals {
  common_tags = {
    Environment = "Production",
    type        = "ReactJS",
    tier        = "Frontend"
  }
}