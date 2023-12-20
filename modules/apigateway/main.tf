data "template_file" "api_swagger" {
  template = file("${path.module}/swagger.yaml")

  vars = {
    backend_url = var.backend_url
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
