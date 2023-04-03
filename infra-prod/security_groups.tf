resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg_name
  description = "Security Group to allow Ingress and Egress traffic on ALB"
  vpc_id      = data.aws_vpc.tech_vpc.id
}

resource "aws_security_group" "rjs_app_sg" {
  name        = var.app_sg_name
  description = "Security Group to allow Ingress and Egress traffic for React and Node app"
  vpc_id      = data.aws_vpc.tech_vpc.id
}