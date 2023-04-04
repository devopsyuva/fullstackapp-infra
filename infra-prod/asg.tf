data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.tech_vpc.id

  tags = {
    Name = "VisualpathTech-private_subnet"
  }
}

resource "aws_autoscaling_group" "visualtech_asg" {
  name = "${var.asg_name}-${aws_launch_template.visualtech_launchtemplate.latest_version}"
  vpc_zone_identifier = data.aws_subnet_ids.private_subnets.ids
  desired_capacity    = 1
  max_size            = 3
  min_size            = 1

  launch_template {
    id      = aws_launch_template.visualtech_launchtemplate.id
    version = aws_launch_template.visualtech_launchtemplate.latest_version
  }

  target_group_arns = [aws_lb_target_group.alb_targetgroup.arn]

  wait_for_capacity_timeout = "300s"
}