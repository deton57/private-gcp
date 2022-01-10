data "google_client_config" "provider" {}

resource "google_container_cluster" "gke-wordpress" {
  name               = var.cluster_name
  location           = var.region
  depends_on         = [var.container_api, var.compute_api, var.pd]
  initial_node_count = var.initial_node_count

  network    = var.network
  subnetwork = var.subnetwork
  node_config {
    labels = var.labels
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-ranges"
    services_secondary_range_name = var.services_secondary_range_name
  }
}

provider "kubernetes" {
  host  = "https://${google_container_cluster.gke-wordpress.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
  google_container_cluster.gke-wordpress.master_auth[0].cluster_ca_certificate)
}