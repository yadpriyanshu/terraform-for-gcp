# Terraform Setting Block
terraform {
  required_version = ">= 1.7.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
  }
}

# Terraform provider block
provider "google" {
  project = var.gcp_project
  region  = var.region
}