variable "gcp_project" {
  description = "Project in which GCP resources to be created"
  type = string
  default = "priyanshu-sandbox"
}

variable "region" {
    description = "Region in which GCP resources to be created"
    type = string
    default = "us-central1"
}

variable "zone" {
    description = "Zone in which GCP resources to be created"
    type = string
    default = "us-central1-a"
}

variable "machine_type" {
  description = "Compute Engine Machine Type"
  type = string
  default = "e2-micro"
}