variable "host" {
  type    = string
  default = "endpoint"
}
variable "token" {
  type    = string
  default = "token"
}
variable "cluster_ca_certificate" {
  type    = string
  default = "cert"
}

variable "db_host" {
  type    = string
  default = "x.x.x.x"
}
variable "db_name" {
  type    = string
  default = "wordpress"
}
variable "username" {
  type    = string
  default = "wordpress"
}
variable "password" {
  type    = string
  default = "password"
}
variable "secret_name" {
  type    = string
  default = "cloudsql-instance-credentials"
}
variable "gke" {
  type    = any
  default = {}
}
variable "pvc" {
  type    = any
  default = {}
}
variable "container_port" {
  type    = number
  default = 80
}
variable "port_name" {
  type    = string
  default = "http"
}
variable "protocol" {
  type    = string
  default = "TCP"
}