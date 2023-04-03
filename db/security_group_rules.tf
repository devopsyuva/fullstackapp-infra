# Security group rules for PostgreSQL traffic, Ingress and Egress
resource "aws_security_group_rule" "psql_ingress_rules" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.tech_vpc.cidr_block]
  security_group_id = aws_security_group.psql_sg.id
}

resource "aws_security_group_rule" "psql_egress_rules" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.psql_sg.id
}