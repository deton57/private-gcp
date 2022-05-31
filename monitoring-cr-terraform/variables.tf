variable "project" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = ""
}
variable "apis" {
  type    = list(any)
  default = ["monitoring.googleapis.com"]
}
