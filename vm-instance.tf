resource "google_compute_instance" "myapp1" {
  name         = "myapp1"
  machine_type = var.machine_type
  zone         = var.zone
  #tags = [ "ssh-tag","webserver-tag" ]
  tags = [tolist(google_compute_firewall.fw_http.target_tags)[0], tolist(google_compute_firewall.fw_ssh.target_tags)[0]]
  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-11"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.sandbox_subnet.id
    access_config {
      
    }
  }
  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")
}