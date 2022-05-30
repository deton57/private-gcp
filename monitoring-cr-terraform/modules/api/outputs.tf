output "monitoring" {
  description = "monitoring api."
  value       = google_project_service.service["monitoring.googleapis.com"]
}