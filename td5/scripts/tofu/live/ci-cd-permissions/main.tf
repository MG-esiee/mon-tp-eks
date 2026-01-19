provider "aws" {
  region = "us-east-2"
}

module "oidc_provider" {
  # Chemin local vers le dossier modules/github-aws-oidc
  source = "../../modules/github-aws-oidc"

  provider_url = "https://token.actions.githubusercontent.com" 
}

module "iam_roles" {
  # Chemin local vers le dossier modules/gh-actions-iam-roles
  source = "../../modules/gh-actions-iam-roles"

  name              = "lambda-sample"
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn
  
  enable_iam_role_for_testing = true
  enable_iam_role_for_plan    = true
  enable_iam_role_for_apply   = true

  # C'EST ICI QUE TU GARDES TES INFOS PERSO
  github_repo               = "MG-esiee/mon-tp-eks"
  lambda_base_name          = "lambda-sample"
  tofu_state_bucket         = "fundamentals-of-devops-tofu-state"
  tofu_state_dynamodb_table = "fundamentals-of-devops-tofu-state"
}