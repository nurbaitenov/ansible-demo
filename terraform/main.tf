resource "google_compute_instance" "ansible_nodes" {
  count = 2

  name         = "ansible-node-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = var.zone

  metadata = {
    ssh-keys = "nursdev017:${var.ssh_public_key}"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  tags = ["ansible-node"]
}
