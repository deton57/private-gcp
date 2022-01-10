variable "project" {
  type    = string
  default = ""
}

variable "zone" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}
variable "apis" {
  type    = list(any)
  default = ["servicenetworking.googleapis.com", "compute.googleapis.com", "container.googleapis.com", "sqladmin.googleapis.com"]
}
variable "network_name" {
  type    = string
  default = "network"
}
variable "subnet_name" {
  type    = string
  default = "subnet"
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

variable "username" {
  type    = string
  default = "wordpress"
}

variable "database" {
  type    = string
  default = "wordpress"
}
variable "initial_node_count" {
  type    = number
  default = 1
}

variable "cluster_name" {
  type    = string
  default = "gke-wordpress"
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
variable "pv_storageclass" {
  type    = string
  default = "standard"
}
variable "pvc_storageclass" {
  type    = string
  default = "standard"
}
variable "labels" {
  type    = map(any)
  default = { app = "wordpress" }
}
variable "secret_name" {
  type    = string
  default = "cloudsql-instance-credentials"
}