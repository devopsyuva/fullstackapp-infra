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
      Name = "VPTech-APP-ALB"
    }
  )

  depends_on = [
    aws_launch_template.app_launchtemplate
  ]

}


resource "aws_lb_listener_certificate" "app_rjs_cert" {
  listener_arn    = aws_lb_listener.rjs_listener.arn
  certificate_arn = "arn:aws:acm:ap-south-1:099730796456:certificate/3ada7a31-2dd8-400c-b2ee-10181c0188ae"
}

resource "aws_lb_listener_certificate" "app_njs_cert" {
  listener_arn    = aws_lb_listener.njs_listener.arn
  certificate_arn = "arn:aws:acm:ap-south-1:099730796456:certificate/3ada7a31-2dd8-400c-b2ee-10181c0188ae"
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

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_njs_tg.arn
  }

  depends_on = [
    aws_lb.app_alb
  ]
}