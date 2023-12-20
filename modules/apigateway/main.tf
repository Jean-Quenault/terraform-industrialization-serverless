data "template_file" "api_swagger" {
  template = file("swagger.yaml")

  vars = {
    host = "${var.backend_url}"
  }
}

resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = var.api_gateway_name
  description = "User API Gateway"
  body        = data.template_file.user_api_swagger.rendered
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "prod" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  stage_name  = "prod"
}