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

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "prod_stage" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.prod.id
}

resource "aws_api_gateway_base_path_mapping" "mapping" {
  api_id      = aws_api_gateway_rest_api.api.id
  stage_name  = aws_api_gateway_stage.prod_stage.stage_name
  domain_name = aws_api_gateway_domain_name.backend_domain.domain_name
}

resource "aws_api_gateway_domain_name" "backend_domain" {
  domain_name              = "backend.jeanops.net"
  certificate_arn          = data.aws_acm_certificate.certificate_backend_domain.arn
}

resource "aws_lambda_permission" "api_gateway_permission_get_status_prod" {
  statement_id  = "AllowAPIGatewayInvokeGetStatusProd"
  action        = "lambda:InvokeFunction"
  function_name = var.get_status_prod_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/GET/status"
}

resource "aws_lambda_permission" "api_gateway_permission_get_users_prod" {
  statement_id  = "AllowAPIGatewayInvokeUsersGetUsersProd"
  action        = "lambda:InvokeFunction"
  function_name = var.get_users_prod_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/GET/users"
}

resource "aws_lambda_permission" "api_gateway_permission_post_users_prod" {
  statement_id  = "AllowAPIGatewayInvokeUsersPost"
  action        = "lambda:InvokeFunction"
  function_name = var.post_users_prod_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/POST/users"
}
