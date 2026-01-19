provider "aws" {
  region = "us-east-2"
}

module "function" {
  # Utilisation du module Lambda du livre
  source = "github.com/brikis98/devops-book//ch3/tofu/modules/lambda"

  name = var.name

  src_dir = "${path.module}/src"
  runtime = "nodejs20.x"
  handler = "index.handler"

  memory_size = 128
  timeout     = 5

  environment_variables = {
    NODE_ENV = "production"
  }
}

module "gateway" {
  # Utilisation du module API Gateway du livre
  source = "github.com/brikis98/devops-book//ch3/tofu/modules/api-gateway"

  name               = var.name
  function_arn       = module.function.function_arn
  api_gateway_routes = ["GET /"]
}

# --- AJOUT DES OUTPUTS POUR LES TESTS ---

output "function_url" {
  value       = module.function.function_url
  description = "L'URL de la fonction Lambda (si activée)"
}

output "api_url" {
  value       = module.gateway.api_url
  description = "L'URL de l'API Gateway"
}

# Ce bloc est indispensable pour que le fichier .tftest.hcl 
# puisse récupérer l'URL à tester via data.http.test_endpoint