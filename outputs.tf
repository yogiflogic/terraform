output "ip_public_vm-1" {
  value       = google_compute_instance.vm-1.network_interface[0].access_config[0].nat_ip
  description = "IP Public VM-1"
}