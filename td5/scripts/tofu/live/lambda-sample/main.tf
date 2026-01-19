module "function" {
  # Ce chemin a fonctionné dans ton log précédent
  source = "github.com/brikis98/devops-book//ch3/tofu/modules/lambda?ref=main"

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
  # On essaie le chemin alternatif qui semble être le bon pour l'API Gateway
  source = "github.com/brikis98/devops-book//modules/api-gateway?ref=main"

  name = var.name
  function_arn       = module.function.function_arn
  api_gateway_routes = ["GET /"]
}