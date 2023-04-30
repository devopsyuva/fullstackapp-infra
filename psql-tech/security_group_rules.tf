# Security group rules for NLB traffic, Ingress and Egress

resource "aws_security_group_rule" "nlb_ingress_rules" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nlb_sg.id
}

resource "aws_security_group_rule" "nlb_egress_rules" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nlb_sg.id
}

# Security group rules for PostgreSQL DB traffic, Ingress and Egress

resource "aws_security_group_rule" "psql_ing_rule" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = data.aws_vpc.prod_vpc.cidr_block
  security_group_id = aws_security_group.psql_sg.id
}

resource "aws_security_group_rule" "ssh_ing_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = data.aws_vpc.prod_vpc.cidr_block
  security_group_id = aws_security_group.psql_sg.id
}

resource "aws_security_group_rule" "psql_egress_rule" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.psql_sg.id
}