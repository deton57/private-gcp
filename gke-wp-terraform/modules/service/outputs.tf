output "service" {
  description = "get external ip"
  value       = kubernetes_service.network-service
}