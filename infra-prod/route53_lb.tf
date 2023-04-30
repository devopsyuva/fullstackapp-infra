resource "aws_route53_record" "dns_alb" {
  zone_id = "Z09297531N1ZRT2KQPG4X"
  name    = "k8sadministrators.com"
  type    = "A"

  alias {
    name                   = aws_lb.app_alb.dns_name
    zone_id                = aws_lb.app_alb.zone_id
  }
}