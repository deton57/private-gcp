output "pvc" {
  description = "pvc"
  value       = kubernetes_persistent_volume_claim.pvc
}

output "pd" {
  description = "pd"
  value       = google_compute_disk.pd
}