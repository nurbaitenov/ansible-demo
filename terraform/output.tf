output "instance_names" {
  value = google_compute_instance.ansible_nodes[*].name
}

output "external_ips" {
  value = google_compute_instance.ansible_nodes[*].network_interface[0].access_config[0].nat_ip
}