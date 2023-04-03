data "aws_vpc" "tech_vpc" {
  tags = {
    Name = "VisualpathTech-prod"
  }
}

resource "aws_security_group" "psql_sg" {
  name        = var.psql_sg_name
  description = "Security Group to allow Ingress and Egress traffic to PostgreSQL Instance"
  vpc_id      = data.aws_vpc.tech_vpc.id
}