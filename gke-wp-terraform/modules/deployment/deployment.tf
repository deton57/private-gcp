provider "kubernetes" {
  host                   = var.host
  token                  = var.token
  cluster_ca_certificate = var.cluster_ca_certificate
}

resource "kubernetes_deployment" "wordpress" {
  depends_on = [var.db_host, var.gke, var.pvc]

  metadata {
    name = "wordpress"
    labels = {
      app = "wordpress"
    }
  }

  spec {

    replicas = 1

    selector {
      match_labels = {
        app = "wordpress"
      }
    }

    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }

      spec {

        container {

          image = "wordpress"
          name  = "wordpress"

          env {
            name = "WORDPRESS_DB_HOST"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "db_host"
              }
            }
          }
          env {
            name = "WORDPRESS_DB_NAME"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "db_name"
              }
            }
          }
          env {
            name = "WORDPRESS_DB_USER"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "username"
              }
            }
          }

          env {
            name = "WORDPRESS_DB_PASSWORD"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "password"
              }
            }
          }

          port {
            name           = var.port_name
            container_port = var.container_port
            protocol       = var.protocol
          }

          volume_mount {
            mount_path = "/var/www/html"
            name       = "persistent-storage-wordpress"
          }



        }
        volume {
          name = "persistent-storage-wordpress"
          persistent_volume_claim {
            claim_name = "pvc"
          }
        }

        volume {
          name = "cloudsql-instance-credentials-wordpress"
          secret {
            secret_name = var.secret_name
          }
        }

      }
    }
  }
}