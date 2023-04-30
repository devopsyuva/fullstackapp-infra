resource "aws_lb_target_group" "nlb_targetgroup" {
  name                          = var.nlb_targetgroup_name
  port                          = 5432
  protocol                      = "TCP"
  target_type                   = "instance"
  ip_address_type               = "ipv4"
  vpc_id                        = data.aws_vpc.prod_vpc.id
  load_balancing_algorithm_type = "round_robin"

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = "200-299,300-399"
    path                = "/"
    protocol            = "TCP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}