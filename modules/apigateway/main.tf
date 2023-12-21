data "template_file" "api_swagger" {
  template = file("${path.module}/swagger.yaml")

  vars = {
    backend_url = var.backend_url
    get_status_prod_lambda_uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.get_status_prod_lambda_arn}/invocations"
    get_users_prod_lambda_uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.get_users_prod_lambda_arn}/invocations"
    post_users_prod_lambda_uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.post_users_prod_lambda_arn}/invocations"
  }
}

resource "aws_api_gateway_rest_api" "api" {
  name        = "api"
  description = "User API Gateway"
  body        = data.template_file.api_swagger.rendered
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "prod" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "prod"
}

data "aws_acm_certificate" "certificate_backend_domain" {
  domain   = "backend.jeanops.net"
  statuses = ["ISSUED"]
}

resource "aws_api_gateway_domain_name" "backend_domain" {
  domain_name              = "backend.jeanops.net"
  certificate_arn          = data.aws_acm_certificate.certificate_backend_domain.arn

}

resource "aws_api_gateway_base_path_mapping" "mapping" {
  api_id      = aws_api_gateway_rest_api.api.id
  stage_name  = aws_api_gateway_stage.mystage.prod
  domain_name = aws_api_gateway_domain_name.backend_domain.domain_name

}

data "aws_route53_zone" "api_dns" {
  name = "backend.jeanops.net"
}


resource "aws_route53_record" "api_dns" {
  zone_id = data.aws_route53_zone.api_dns.id
  name    = "backend.jeanops.net"
  type    = "CNAME"
  records = [aws_api_gateway_domain_name.backend_domain.cloudfront_domain_name]
  ttl     = "300"
}
