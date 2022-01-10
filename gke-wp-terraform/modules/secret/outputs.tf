output "db_host" {
  description = "Kubernetes Secret database host for Deployment use."
  value       = kubernetes_secret.cloudsql-db-credentials.data.db_host
}
output "db_name" {
  description = "Kubernetes Secret database name for Deployment use."
  value       = kubernetes_secret.cloudsql-db-credentials.data.db_name
}
output "username" {
  description = "Kubernetes Secret username for Deployment use."
  value       = kubernetes_secret.cloudsql-db-credentials.data.username
}
output "password" {
  description = "Kubernetes Secret password for Deployment use."
  value       = kubernetes_secret.cloudsql-db-credentials.data.password
}
output "secret_name" {
  description = "Kubernetes Secret name for Deployment use."
  value       = kubernetes_secret.cloudsql-db-credentials.metadata.0.name
}