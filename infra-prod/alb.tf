resource "aws_lb" "app_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = data.aws_subnets.public_subnets.ids #[for subnet in data.aws_subnets.public_subnets : subnet.id]
  ip_address_type    = "ipv4"

  tags = merge(
    local.common_tags,
    {
      Name = "AssestHub-APP-ALB"
    }
  )

  depends_on = [
    aws_launch_template.app_launchtemplate
  ]

}

resource "aws_lb_listener" "redirect_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  depends_on = [
    aws_lb.app_alb
  ]
}

resource "aws_lb_listener" "rjs_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:ap-south-1:099730796456:certificate/512130ba-7396-4a5a-a5be-20af3914e262"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_rjs_tg.arn
  }

  depends_on = [
    aws_lb.app_alb
  ]
}

resource "aws_lb_listener" "njs_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "444"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:ap-south-1:099730796456:certificate/512130ba-7396-4a5a-a5be-20af3914e262"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_njs_tg.arn
  }

  depends_on = [
    aws_lb.app_alb
  ]
}