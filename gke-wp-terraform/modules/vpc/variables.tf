variable "project" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = "us-central1"
}
variable "secret_name" {
  type    = string
  default = "secret"
}
variable "network_name" {
  type    = string
  default = "network"
}
variable "subnet_name" {
  type    = string
  default = "subnet"
}
variable "service_networking_api" {
  type    = any
  default = {}
}
variable "compute_api" {
  type    = any
  default = {}
}
variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "service_range" {
  type    = string
  default = "10.1.0.0/16"
}
variable "pods_range" {
  type    = string
  default = "10.2.0.0/16"
}
