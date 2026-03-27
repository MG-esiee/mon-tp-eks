terraform {
  backend "s3" {
    bucket         = "mateogallina-devops-tofu-state-unique"
    key            = "td5/scripts/tofu/live/tofu-state/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "mateogallina-devops-tofu-state-unique"
  }
}