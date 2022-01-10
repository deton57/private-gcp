resource "google_project_service" "service" {
  project  = var.project
  for_each = toset(var.apis)
  service  = each.key

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
