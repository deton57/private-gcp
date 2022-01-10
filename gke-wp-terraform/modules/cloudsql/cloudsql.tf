resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "cloudsql" {
  depends_on          = [var.private_network, var.sqladmin_api, var.private_vpc_connection]
  name                = "${var.db_prefix}-${random_id.db_name_suffix.hex}"
  project             = var.project
  database_version    = var.database_version
  deletion_protection = false
  settings {
    tier              = var.tier
    availability_type = var.availability_type
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network
    }

  }
}

data "google_sql_database_instance" "cloudsql" {
  name = "cloudsql-wp-${random_id.db_name_suffix.hex}"
}

resource "random_password" "wordpress-cloudsql-password" {
  length           = var.password_length
  special          = true
  override_special = "_%@"
}

resource "local_file" "password-file" {
  content  = random_password.wordpress-cloudsql-password.result
  filename = var.passwordfile_path
}

resource "google_sql_user" "cloudsql-wordpress-user" {
  name     = "wordpress"
  instance = google_sql_database_instance.cloudsql.name
  host     = "%"
  password = random_password.wordpress-cloudsql-password.result
}

resource "google_sql_database" "database" {
  name     = "wordpress"
  instance = google_sql_database_instance.cloudsql.name
}
