variable "db_instance_name" {
  description = "Provide name for PostgreSQL instance"
  type        = string
  default     = "visualpathtechpsql"
}

variable "min_storage" {
  description = "Provide min value of storage size in GiB"
  type        = number
  default     = 30
}

variable "max_storage" {
  description = "Provide max value of storage size in GiB"
  type        = number
  default     = 100
}

variable "db_instance_type" {
  description = "Provide DB instnace type for resource allocation"
  type        = string
  default     = "db.t3.medium"
}

variable "db_admin_password" {
  description = "PostgreSQL admin user password"
  type        = string
}

variable "aws_region" {
  description = "Provide Region name on which to launch DB"
  default     = "ap-south-1"
}

variable "psql_sg_name" {
  description = "Provide name to PSQL security group"
  type        = string
  default     = "VisualpathTech-psql-sg"
}