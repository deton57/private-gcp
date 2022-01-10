output "compute" {
  description = "compute api."
  value       = google_project_service.service["compute.googleapis.com"]
}
output "servicenetworking" {
  description = "service networking api."
  value       = google_project_service.service["servicenetworking.googleapis.com"]
}
output "sqladmin" {
  description = "sqladmin api."
  value       = google_project_service.service["sqladmin.googleapis.com"]
}
output "container" {
  description = "gke api."
  value       = google_project_service.service["container.googleapis.com"]
}