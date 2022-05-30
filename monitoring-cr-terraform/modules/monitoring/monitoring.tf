resource "google_monitoring_dashboard" "dashboard" {
  project        = var.project
  dashboard_json = file("dashboard.json")
}