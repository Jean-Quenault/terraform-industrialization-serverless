provider "aws" {
  alias = "virginia"
  region = "us-east-1"
}

data "aws_acm_certificate" "certificate_backend_domain" {
  provider = aws.virginia
  domain   = "backend.jeanops.net"
  statuses = ["ISSUED"]
}