output "alb_endpoint" {
  description = "ALB endpoint to access VisualpathTech application"
  value = aws_lb.visualtech_asg.dns_name
}