output "host" {
  description = "Kubernetes Host"
  value       = "https://${google_container_cluster.gke-wordpress.endpoint}"
}
output "token" {
  description = "Kubernetes Token"
  value       = data.google_client_config.provider.access_token
}
output "cluster_ca_certificate" {
  description = "Certificate"
  value = base64decode(
  google_container_cluster.gke-wordpress.master_auth[0].cluster_ca_certificate)
}
output "gke" {
  description = "GKE Cluster"
  value       = google_container_cluster.gke-wordpress
}