variable "project" {
  type    = string
  default = ""
}
variable "apis" {
  type    = list(any)
  default = ["servicenetworking.googleapis.com", "compute.googleapis.com", "container.googleapis.com", "sqladmin.googleapis.com"]
}

