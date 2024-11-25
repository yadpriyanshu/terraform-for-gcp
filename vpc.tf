# Resource Block for VPC
resource "google_compute_network" "sandbox_vpc" {
  name                    = "sandbox-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "sandbox_subnet" {
  name          = "us-central1-subnet"
  region        = "us-central1"
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.sandbox_vpc.id
}

resource "google_compute_firewall" "fw_ssh" {
  name    = "fwrule-allow-ssh"
  network = google_compute_network.sandbox_vpc.id
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}

resource "google_compute_firewall" "fw_http" {
  name    = "fwrule-allow-http"
  network = google_compute_network.sandbox_vpc.id
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver-tag"]
}