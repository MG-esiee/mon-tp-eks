provider "aws" {
  region = "us-east-2"
}

module "state" {
  # Chemin local vers le module que tu as normalement copié tout à l'heure
  source = "../../modules/state-bucket"

  # Choisis un nom UNIQUE (AWS rejette les doublons sur S3)
  # Exemple: devops-lab2-votre-nom-tofu-state
  name   = "mateogallina-devops-tofu-state-unique" 
}

output "s3_bucket_name" {
  value = module.state.s3_bucket_name
}

output "dynamodb_table_name" {
  value = module.state.dynamodb_table_name
}