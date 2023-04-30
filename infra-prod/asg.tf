resource "aws_autoscaling_group" "app_asg" {
  name                = var.asg_name
  vpc_zone_identifier = data.aws_subnets.private_subnets.ids
  desired_capacity    = 1
  max_size            = 3
  min_size            = 1

  launch_template {
    id      = aws_launch_template.app_launchtemplate.id
    version = aws_launch_template.app_launchtemplate.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
  }

  health_check_type = "EC2"

  depends_on = [
    aws_launch_template.app_launchtemplate
  ]

  target_group_arns = [ aws_lb_target_group.app_targetgroup.arn ]

  wait_for_capacity_timeout = "300s"
}