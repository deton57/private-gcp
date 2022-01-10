variable "project" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = "us-central1"
}
variable "zone" {
  type    = string
  default = "us-central1-a"
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
variable "disk_size" {
  type        = number
  description = "pd size in GB"
  default     = 100
}
variable "disk_type" {
  type        = string
  description = "pd/ssd"
  default     = "pd-standard"
}
variable "disk_name" {
  type    = string
  default = "wordpress-disk"
}

variable "pv_name" {
  type    = string
  default = "pv"
}

variable "pvc_name" {
  type    = string
  default = "pvc"
}

variable "pv_storage" {
  type    = string
  default = "10Gi"
}

variable "pvc_storage" {
  type    = string
  default = "10Gi"
}
variable "pv_accessmode" {
  type    = string
  default = "ReadWriteOnce"
}

variable "pvc_accessmode" {
  type    = string
  default = "ReadWriteOnce"
}
variable "pv_storageclass" {
  type    = string
  default = "standard"
}
variable "pvc_storageclass" {
  type    = string
  default = "standard"
}

variable "compute_api" {
  type    = any
  default = {}
}
