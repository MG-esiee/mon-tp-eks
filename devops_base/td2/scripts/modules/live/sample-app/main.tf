provider "aws" {
  region = "us-east-2"
}

# Exercice 11 : GitHub
module "app_github" {
  source = "github.com/MG-esiee/my-opentofu-modules.git?ref=v1.0.0"
  ami_id = "ami-0ff27d814cd307a6c"
  name   = "app-from-github"
}

# Exercice 12 : Registry Public
module "web_server_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "4.17.1"

  name        = "web-server-public"
  description = "Security group for HTTP"
  vpc_id      = "vpc-030df9105584e2822"
}
