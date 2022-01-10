output "private_network" {
  description = "VPC"
  value       = google_compute_network.network.id
}
output "subnetwork" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.subnet.id
}

output "services_secondary_range_name" {
  description = "Secondary network range name for services"
  value       = google_compute_subnetwork.subnet.secondary_ip_range.0.range_name
}

output "private_vpc_connection" {
  description = "Private VPC connection"
  value       = google_service_networking_connection.private_vpc_connection
}