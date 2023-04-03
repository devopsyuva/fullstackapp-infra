#data "aws_subnets" "public_subnets" {
#  tags = {
#    Name = "VisualpathTech-public_subnet"
#  }
#}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.tech_vpc.id

  tags = {
    Name = "VisualpathTech-public_subnet"
  }
}

resource "aws_lb" "visualtech_asg" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = data.aws_subnet_ids.public_subnets.ids #[for subnet in data.aws_subnets.public_subnets : subnet.id]
  ip_address_type    = "ipv4"

  enable_deletion_protection = false

  #access_logs {
  #  bucket  = aws_s3_bucket.lb_logs.id
  #  prefix  = "visualpathtech-alb-logs"
  #  enabled = true
  #}

  tags = merge(
    local.common_tags,
    {
      Name = "VisualpathTech-ALB"
    }
  )

  depends_on = [
    aws_launch_template.visualtech_launchtemplate
  ]

}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.visualtech_asg.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_targetgroup.arn
  }

  depends_on = [
    aws_lb.visualtech_asg
  ]
}