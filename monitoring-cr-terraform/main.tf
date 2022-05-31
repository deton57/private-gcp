provider "google" {
  project = var.project
  region  = var.region
}

module "api" {
  source  = "./modules/api"
  project = var.project
  apis    = var.apis
}

module "monitoring" {
  source  = "./modules/monitoring"
  project = var.project
}
