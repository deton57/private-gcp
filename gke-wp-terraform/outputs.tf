output "network" {
  description = "VPC"
  value       = module.vpc.private_network
}

output "subnetwork" {
  description = "Subnetwork"
  value       = module.vpc.subnetwork
}

output "gke" {
  description = "GKE cluster name"
  value       = module.gke.gke.name
}

output "private_ip_address" {
  description = "MYSQL private IP Address"
  value       = module.cloudsql.private_ip_address
}

output "external_ip" {
  description = "External IP Address of the service"
  value       = module.service.service.status[0].load_balancer[0].ingress[0].ip
}
