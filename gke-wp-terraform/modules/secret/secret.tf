provider "kubernetes" {
  host                   = var.host
  token                  = var.token
  cluster_ca_certificate = var.cluster_ca_certificate
}

resource "kubernetes_secret" "cloudsql-db-credentials" {
  depends_on = [var.gke]
  metadata {
    name = "cloudsql-db-credentials"
  }
  data = {
    "username" = var.username
    "db_name"  = var.database
    "password" = var.random_password
    "db_host"  = var.private_ip_address
  }
}
