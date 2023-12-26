data "aws_route53_zone" "root_zone" {
  name = "jeanops.net"
}

resource "aws_route53_record" "api_dns" {
  zone_id = data.aws_route53_zone.root_zone.id
  name    = "backend.jeanops.net"
  type    = "CNAME"
  records = [aws_api_gateway_domain_name.backend_domain.cloudfront_domain_name]
  ttl     = "300"
}