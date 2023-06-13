variable "aws_region" {
  description = "Region on which to host Visualpath Tech application"
  type        = string
  default     = "ap-south-1"
}

variable "asg_name" {
  description = "Provide name for ASG to implement VisualpathTech app"
  type        = string
  default     = "VPTEdu-PSQL-asg"
}

variable "psql_template_name" {
  description = "Provide name that to be assigned launch template"
  type        = string
  default     = "VPTEdu-PSQL"
}

variable "psql_launch_type" {
  description = "Launch type to allocate resources for ASG instances"
  type        = string
  default     = "t2.medium"
}

variable "psql_keypair" {
  description = "Keypair name assign EC2 instance, not managed through Terraform"
  type        = string
  default     = "vptedu"
}

variable "nlb_name" {
  description = "Provide name that to be assigned for Frontend ALB"
  type        = string
  default     = "vptedu-psql-nlb"
}

variable "nlb_targetgroup_name" {
  description = "Provide ALB target group name"
  type        = string
  default     = "VPTEdu-PSQL"
}

variable "nlb_sg_name" {
  description = "Provide name to ALB security group"
  type        = string
  default     = "VPTEdu-NLB-sg"
}

variable "psql_sg_name" {
  description = "Provide name to EC2 attached security groups through ASG"
  type        = string
  default     = "VPTEdu-PSQL-sg"
}

variable "psql_role_name" {
  description = "Provide IAM porfile role name"
  type        = string
  default     = "VPTEdu-PSQL-role"
}

variable "psql_profile_name" {
  description = "Provide Instance profile name"
  type        = string
  default     = "VPTEdu-PSQL-profile"
}

variable "psql_policy_name" {
  description = "Provide role policy name"
  type        = string
  default     = "VPTEdu-PSQL-policy"
}

locals {
  common_tags = {
    Environment = "Production",
    type        = "psql-db"
  }
}