resource "aws_autoscaling_attachment" "asg_rjs_attach" {
  autoscaling_group_name = aws_autoscaling_group.app_asg.id
  lb_target_group_arn    = aws_lb_target_group.app_rjs_tg.arn
}

resource "aws_autoscaling_attachment" "asg_njs_attach" {
  autoscaling_group_name = aws_autoscaling_group.app_asg.id
  lb_target_group_arn    = aws_lb_target_group.app_njs_tg.arn
}