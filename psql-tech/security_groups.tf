resource "aws_security_group" "nlb_sg" {
  name        = var.nlb_sg_name
  description = "Security Group to allow Ingress and Egress traffic on NLB"
  vpc_id      = data.aws_vpc.prod_vpc.id
}

resource "aws_security_group" "psql_sg" {
  name        = var.psql_sg_name
  description = "Security Group to allow Ingress and Egress traffic for PostgreSQL DB"
  vpc_id      = data.aws_vpc.prod_vpc.id
}