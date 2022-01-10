variable "username" {
  type    = string
  default = "wordpress"
}

variable "database" {
  type    = string
  default = "wordpress"
}
variable "random_password" {
  type    = string
  default = "test"
}

variable "private_ip_address" {
  type    = string
  default = "x.x.x.x"
}
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
variable "gke" {
  type    = any
  default = {}
}
