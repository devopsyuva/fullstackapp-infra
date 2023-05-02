output "alb_endpoint" {
  description = "ALB endpoint to access AssestHub application"
  value = aws_lb.app_alb.dns_name
}