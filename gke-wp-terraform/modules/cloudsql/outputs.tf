output "random_password" {
  description = "Random generated password."
  value       = random_password.wordpress-cloudsql-password.result
}

output "private_ip_address" {
  description = "private ip of the Cloud SQL Instance"
  value       = google_sql_database_instance.cloudsql.private_ip_address
}
output "random_value_from_db" {
  description = "Random generated value."
  value       = random_id.db_name_suffix.hex
}