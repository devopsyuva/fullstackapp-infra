resource "aws_autoscaling_group" "psql_asg" {
  name                = var.asg_name
  vpc_zone_identifier = data.aws_subnet_ids.private_subnets.ids
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1

  launch_template {
    id      = aws_launch_template.vpt_launchtemplate.id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"
  }

  health_check_type = "EC2"

  target_group_arns = [aws_lb_target_group.nlb_targetgroup.arn]

  wait_for_capacity_timeout = "300s"

  depends_on = [
    aws_launch_template.vpt_launchtemplate
  ]

  tag = merge(
    local.common_tags,
    {
      Name = "VPTech-PSQL-ASG"
    }
  )
}