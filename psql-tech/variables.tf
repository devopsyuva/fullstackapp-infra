variable "aws_region" {
  description = "Region on which to host Visualpath Tech application"
  type        = string
  default     = "ap-south-1"
}

variable "asg_name" {
  description = "Provide name for ASG to implement VisualpathTech app"
  type        = string
  default     = "tech-asg"
}

variable "psql_template_name" {
  description = "Provide name that to be assigned launch template"
  type        = string
  default     = "VPTech-PSQL"
}

variable "psql_launch_type" {
  description = "Launch type to allocate resources for ASG instances"
  type        = string
  default     = "t3.medium"
}

variable "psql_keypair" {
  description = "Keypair name assign EC2 instance, not managed through Terraform"
  type        = string
  default     = "VisualpathTech"
}

variable "nlb_name" {
  description = "Provide name that to be assigned for Frontend ALB"
  type        = string
  default     = "VisualpathTech-ReactJS-alb"
}

variable "nlb_targetgroup_name" {
  description = "Provide ALB target group name"
  type        = string
  default     = "Techtg"
}

variable "nlb_sg_name" {
  description = "Provide name to ALB security group"
  type        = string
  default     = "VisualpathTech-ALB-sg"
}

variable "psql_sg_name" {
  description = "Provide name to EC2 attached security groups through ASG"
  type        = string
  default     = "VisualpathTech-APP-sg"
}

variable "instance_profile_role" {
  description = "Provide IAM porfile role name"
  type        = string
  default     = "tech-profile"
}

variable "instance_profile_policy" {
  description = "Provide Profile policy name"
  type        = string
  default     = "techprofile-policy"
}

variable "instance_profile" {
  description = "Provide Instance profile name"
  type        = string
  default     = "tech-profile"
}

variable "codedeploy_role_name" {
  description = "Provide IAM role name for codedeploy"
  type        = string
  default     = "visualpathtech-codedeploy"
}

locals {
  common_tags = {
    Environment = "Production",
    type        = "psql-db"
  }
}