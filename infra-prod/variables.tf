variable "aws_region" {
  description = "Region on which to host Visualpath Tech application"
  type        = string
  default     = "ap-south-1"
}

variable "app_template_name" {
  description = "Provide name that to be assigned launch template"
  type        = string
  default     = "TDPyuva-Fullstack"
}

variable "app_policy_name" {
  description = "Provide name that to policy"
  type        = string
  default     = "TDPyuva-app-policy"
}

variable "app_profile_name" {
  description = "Provide name that to Profile"
  type        = string
  default     = "TDPyuva-app-profile"
}

variable "app_role_name" {
  description = "Provide name that to policy"
  type        = string
  default     = "TDPyuva-app-role"
}

variable "app_launch_type" {
  description = "Launch type to allocate resources for ASG instances"
  type        = string
  default     = "t2.medium"
}

variable "app_keypair" {
  description = "Keypair name assign EC2 instance, not managed through Terraform"
  type        = string
  default     = "tdpyuva"
}

variable "alb_name" {
  description = "Provide name that to be assigned for Frontend ALB"
  type        = string
  default     = "tdpyuva-app-alb"
}

variable "rjs_targetgroup_name" {
  description = "Provide ALB target group name"
  type        = string
  default     = "TDPyuva-RJS-tg"
}

variable "njs_targetgroup_name" {
  description = "Provide ALB target group name"
  type        = string
  default     = "TDPyuva-NJS-tg"
}

variable "asg_name" {
  description = "Provide name to ASG"
  type        = string
  default     = "TDPyuva-ALB-asg"
}

variable "alb_sg_name" {
  description = "Provide name to ALB security group"
  type        = string
  default     = "TDPyuva-ALB-sg"
}

variable "app_sg_name" {
  description = "Provide name to EC2 attached security groups through ASG"
  type        = string
  default     = "TDPyuva-APP-sg"
}

locals {
  common_tags = {
    Environment = "Production",
    type        = "Fullstack",
  }
}