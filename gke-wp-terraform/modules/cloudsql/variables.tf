variable "project" {
  type    = string
  default = ""
}

variable "private_network" {
  type    = string
  default = "wordpress"
}

variable "sqladmin_api" {
  type    = any
  default = {}
}

variable "database_version" {
  type    = string
  default = "MYSQL_5_7"
}

variable "tier" {
  type    = string
  default = "db-f1-micro"
}
variable "availability_type" {
  type    = string
  default = "ZONAL"
}

variable "db_prefix" {
  type    = string
  default = "clousql-wp"
}

variable "password_length" {
  type    = number
  default = 18
}

variable "passwordfile_path" {
  type    = string
  default = "./password-file"
}

variable "private_vpc_connection" {
  type    = any
  default = {}
}