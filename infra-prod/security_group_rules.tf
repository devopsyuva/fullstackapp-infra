# Security group rules for ALB traffic, Ingress and Egress

resource "aws_security_group_rule" "alb_ing_insecure" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "rjs_ing_secure" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "njs_ing_secure" {
  type              = "ingress"
  from_port         = 444
  to_port           = 444
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_eg_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

# Security group rules for ReactJS and NodeJS application traffic, Ingress and Egress

resource "aws_security_group_rule" "ssh_ing_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${data.aws_vpc.prod_vpc.cidr_block}"]
  security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "rjs_ing_rule" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["${data.aws_vpc.prod_vpc.cidr_block}"]
  security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "njs_ing_rule" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp"
  cidr_blocks       = ["${data.aws_vpc.prod_vpc.cidr_block}"]
  security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "app_egress_rule" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_sg.id
}