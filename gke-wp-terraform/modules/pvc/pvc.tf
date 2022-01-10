provider "kubernetes" {
  host                   = var.host
  token                  = var.token
  cluster_ca_certificate = var.cluster_ca_certificate
}

resource "google_compute_disk" "pd" {
  depends_on = [var.compute_api]
  name       = var.disk_name
  project    = var.project
  type       = var.disk_type
  zone       = var.zone
  size       = var.disk_size
}

resource "kubernetes_persistent_volume" "pv" {
  depends_on = [var.gke]
  metadata {
    name = var.pv_name
  }
  spec {
    capacity = {
      storage = "${var.pv_storage}"
    }
    storage_class_name = var.pv_storageclass
    access_modes       = ["ReadWriteOnce"]
    persistent_volume_source {
      gce_persistent_disk {
        pd_name = google_compute_disk.pd.name
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "pvc" {
  depends_on = [var.gke]
  metadata {
    name = var.pvc_name
  }
  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pvc_storageclass
    resources {
      requests = {
        storage = "${var.pvc_storage}"
      }
    }
    volume_name = kubernetes_persistent_volume.pv.metadata.0.name
  }
}