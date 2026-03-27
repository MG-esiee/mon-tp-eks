provider "aws" {
  region = "us-east-2"
}

# On récupère l'OIDC créé en Partie 1
data "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"
}

module "iam_roles" {
  source = "../../modules/gh-actions-iam-roles"

  name                        = "lambda-sample"
  oidc_provider_arn           = data.aws_iam_openid_connect_provider.github.arn
  
  # On active tout pour le CD
  enable_iam_role_for_testing  = true
  enable_iam_role_for_plan     = true
  enable_iam_role_for_apply    = true

  github_repo                 = "TON_NOM_GITHUB/TON_REPO" 
  lambda_base_name            = "lambda-sample"
  tofu_state_bucket           = "mateogallina-devops-tofu-state-unique"
  tofu_state_dynamodb_table   = "mateogallina-devops-tofu-state-unique"
}