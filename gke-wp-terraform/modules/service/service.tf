provider "kubernetes" {
  host                   = var.host
  token                  = var.token
  cluster_ca_certificate = var.cluster_ca_certificate
}

resource "kubernetes_service" "network-service" {
  metadata {
    name = "network-service"
  }
  spec {
    selector = {
      app = var.app
    }
    port {
      port        = var.port
      target_port = var.target_port
    }

    type = var.service_type
  }
}
