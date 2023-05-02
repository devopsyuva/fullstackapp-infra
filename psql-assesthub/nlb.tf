resource "aws_lb" "psql_nlb" {
  name               = var.nlb_name
  internal           = true
  load_balancer_type = "network"
  subnets            = data.aws_subnets.private_subnets.ids #[for subnet in data.aws_subnets.public_subnets : subnet.id]
  ip_address_type    = "ipv4"

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  tags = merge(
    local.common_tags,
    {
      Name = "AssestHub-PSQL-NLB"
    }
  )

  depends_on = [
    aws_launch_template.vpt_launchtemplate,
    aws_autoscaling_group.psql_asg
  ]

}

resource "aws_lb_listener" "psql_listener" {
  load_balancer_arn = aws_lb.psql_nlb.arn
  port              = "5432"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_targetgroup.arn
  }

  depends_on = [
    aws_lb.psql_nlb
  ]
}