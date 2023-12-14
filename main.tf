provider "aws" {
    region = "eu-west-3"
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
