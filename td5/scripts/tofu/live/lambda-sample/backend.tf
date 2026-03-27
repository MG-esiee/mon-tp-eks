terraform {
  backend "s3" {
    bucket         = "mateogallina-devops-tofu-state-unique"
    # ATTENTION : La key doit être différente ici pour ne pas écraser l'autre
    key            = "td5/scripts/tofu/live/lambda-sample/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "mateogallina-devops-tofu-state-unique"
  }
}