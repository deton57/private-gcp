provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}
module "api" {
  source  = "./modules/api"
  project = var.project
  apis    = var.apis
}

module "vpc" {
  source                 = "./modules/vpc"
  project                = var.project
  compute_api            = module.api.compute
  service_networking_api = module.api.servicenetworking

}

module "cloudsql" {
  source                 = "./modules/cloudsql"
  project                = var.project
  private_network        = module.vpc.private_network
  sqladmin_api           = module.api.sqladmin
  private_vpc_connection = module.vpc.private_vpc_connection
}

module "gke" {
  source                        = "./modules/gke"
  project                       = var.project
  random_value_from_db          = module.cloudsql.random_value_from_db
  network                       = module.vpc.private_network
  subnetwork                    = module.vpc.subnetwork
  compute_api                   = module.api.compute
  container_api                 = module.api.container
  region                        = var.region
  pd                            = module.pvc.pd
  services_secondary_range_name = module.vpc.services_secondary_range_name
}

module "pvc" {
  source                 = "./modules/pvc"
  project                = var.project
  host                   = module.gke.host
  token                  = module.gke.token
  region                 = var.region
  zone                   = var.zone
  compute_api            = module.api.compute
  gke                    = module.gke.gke
  cluster_ca_certificate = module.gke.cluster_ca_certificate
}
module "secret" {
  source                 = "./modules/secret"
  username               = var.username
  database               = var.database
  random_password        = module.cloudsql.random_password
  private_ip_address     = module.cloudsql.private_ip_address
  host                   = module.gke.host
  token                  = module.gke.token
  gke                    = module.gke.gke
  cluster_ca_certificate = module.gke.cluster_ca_certificate
}

module "deployment" {
  source                 = "./modules/deployment"
  host                   = module.gke.host
  token                  = module.gke.token
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  secret_name            = module.secret.secret_name
  gke                    = module.gke.gke
  pvc                    = module.pvc.pvc
}

module "service" {
  source                 = "./modules/service"
  port                   = var.port
  target_port            = var.target_port
  app                    = var.app
  service_type           = var.service_type
  host                   = module.gke.host
  token                  = module.gke.token
  cluster_ca_certificate = module.gke.cluster_ca_certificate
}