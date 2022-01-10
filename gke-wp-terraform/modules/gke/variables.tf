variable "project" {
  type    = string
  default = ""
}
variable "network" {
  type    = string
  default = "wordpress"
}

variable "subnetwork" {
  type    = string
  default = "wordpress"
}
variable "services_secondary_range_name" {
  type    = string
  default = "wordpress"
}

variable "random_value_from_db" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = "us-central1"
}
variable "initial_node_count" {
  type    = number
  default = 1
}
variable "container_api" {
  type    = any
  default = {}
}
variable "compute_api" {
  type    = any
  default = {}
}
variable "cluster_prefix" {
  type    = string
  default = "gke"
}

variable "cluster_name" {
  type    = string
  default = "gke-wordpress"
}
variable "labels" {
  type    = map(any)
  default = { app = "wordpress" }
}
variable "pd" {
  type    = any
  default = {}
}