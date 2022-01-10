resource "google_compute_network" "network" {
  name                    = var.network_name
  project                 = var.project
  auto_create_subnetworks = "false"
  depends_on              = [var.compute_api]
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  project       = var.project
  region        = var.region
  network       = google_compute_network.network.name
  ip_cidr_range = var.subnet_cidr
  depends_on    = [var.compute_api]
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.service_range
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = var.pods_range
  }
}


resource "google_compute_global_address" "private_ip_address" {
  name          = google_compute_network.network.name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.network.name
  depends_on    = [var.compute_api]
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["${google_compute_global_address.private_ip_address.name}"]
  depends_on              = [var.service_networking_api]
}