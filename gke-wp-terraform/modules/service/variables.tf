variable "app" {
  type    = string
  default = "wordpress"
}

variable "port" {
  type    = number
  default = 80
}

variable "target_port" {
  type    = number
  default = 80
}

variable "service_type" {
  type    = string
  default = "LoadBalancer"
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