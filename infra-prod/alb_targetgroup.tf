data "aws_vpc" "tech_vpc" {
  tags = {
    Name = "VisualpathTech-prod"
  }
}

resource "aws_lb_target_group" "alb_targetgroup" {
  name                          = "${var.alb_targetgroup_name}"
  port                          = 3000
  protocol                      = "HTTP"
  target_type                   = "instance"
  ip_address_type               = "ipv4"
  vpc_id                        = data.aws_vpc.tech_vpc.id
  load_balancing_algorithm_type = "round_robin"

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = "200-299"
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  #lifecycle {
  #  create_before_destroy = true
  #}
}