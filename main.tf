provider "aws" {
    region = "eu-west-3"
}

provider "aws" {
  alias = "acm"
  region = "us-east-1"
}

module "front" {
  source            = "./modules/front"
  vpc_id            = var.vpc_id
  region            = var.region
  ecr_front_url     = "980377181750.dkr.ecr.eu-west-3.amazonaws.com"
  certificate_front = "arn:aws:acm:eu-west-3:980377181750:certificate/dc5fe3dd-2d06-4dad-a754-9ad14ee334cd"
  subnets            = [var.subnet1, var.subnet2, var.subnet3]
  front_port        ="80"
  front_image       ="front"
  front_image_tag   ="15"
}

module "apigateway" {
  source = "./modules/apigateway"
  region = var.region
  table_name = var.table_name
  dynamodb_arn = var.dynamodb_arn
  backend_url = var.backend_url
  get_status_prod_lambda_arn = module.lambdas.get_status_prod_lambda_arn
  get_users_prod_lambda_arn  = module.lambdas.get_users_prod_lambda_arn
  post_users_prod_lambda_arn = module.lambdas.post_users_prod_lambda_arn
}

module "lambdas" {
  source = "./modules/lambdas"
  region = var.region
  table_name = var.table_name
  dynamodb_arn = var.dynamodb_arn

}