output "alb_endpoint" {
  description = "NLB endpoint to access TDPyuva PSQL DB"
  value       = aws_lb.psql_nlb.dns_name
}