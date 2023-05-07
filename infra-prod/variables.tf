variable "aws_region" {
  description = "Region on which to host Visualpath Tech application"
  type        = string
  default     = "ap-south-1"
}

variable "app_template_name" {
  description = "Provide name that to be assigned launch template"
  type        = string
  default     = "VPTech-Fullstack"
}

variable "app_policy_name" {
  description = "Provide name that to policy"
  type        = string
  default     = "VPTech-app-policy"
}

variable "app_profile_name" {
  description = "Provide name that to Profile"
  type        = string
  default     = "VPTech-app-profile"
}

variable "app_role_name" {
  description = "Provide name that to policy"
  type        = string
  default     = "VPTech-app-role"
}

variable "app_launch_type" {
  description = "Launch type to allocate resources for ASG instances"
  type        = string
  default     = "t2.medium"
}

variable "app_keypair" {
  description = "Keypair name assign EC2 instance, not managed through Terraform"
  type        = string
  default     = "VisualpathTech"
}

variable "alb_name" {
  description = "Provide name that to be assigned for Frontend ALB"
  type        = string
  default     = "visualpathtech-alb"
}

variable "rjs_targetgroup_name" {
  description = "Provide ALB target group name"
  type        = string
  default     = "VPTech-RJS-tg"
}

variable "njs_targetgroup_name" {
  description = "Provide ALB target group name"
  type        = string
  default     = "VPTech-NJS-tg"
}

variable "asg_name" {
  description = "Provide name to ASG"
  type        = string
  default     = "VPTech-ALB-asg"
}

variable "alb_sg_name" {
  description = "Provide name to ALB security group"
  type        = string
  default     = "VPTech-ALB-sg"
}

variable "app_sg_name" {
  description = "Provide name to EC2 attached security groups through ASG"
  type        = string
  default     = "VPTech-APP-sg"
}

locals {
  common_tags = {
    Environment = "Production",
    type        = "Fullstack",
  }
}