# GCP Project vars
project = ""
region  = "us-central1"
zone    = "us-central1-a"
apis    = ["servicenetworking.googleapis.com", "compute.googleapis.com", "container.googleapis.com", "sqladmin.googleapis.com"]

# VPC Vars 

network_name  = "network"
subnet_name   = "subnet"
subnet_cidr   = "10.0.0.0/16"
service_range = "10.1.0.0/16"
pods_range    = "10.2.0.0/16"

# Cloud SQL Vars
database_version   = "MYSQL_5_7"
tier               = "db-f1-micro"
availability_type  = "ZONAL"
username           = "wordpress"
database           = "wordpress"
initial_node_count = 1

# PD Vars
disk_name = "wordpress-disk"
disk_type = "pd-standard"
disk_size = 100

# GKE Vars
cluster_name = "gke-wordpress"
labels       = { app = "wordpress" }

# Kubernetes Vars
app              = "wordpress"
secret_name      = "cloudsql-instance-credentials"
port             = 80
target_port      = 80
service_type     = "LoadBalancer"
pv_name          = "pv"
pvc_name         = "pvc"
pv_storage       = "10Gi"
pvc_storage      = "10Gi"
pv_storageclass  = "standard"
pvc_storageclass = "standard" 
