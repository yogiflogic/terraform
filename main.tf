terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.4.0"
    }
  }
}

provider "google" {
  project = "terraform-project"
  region  = "asia-southeast1" //singapore
}

# resource "google_service_account" "default" {
#   account_id   = "my-custom-sa"
#   display_name = "Custom SA for VM Instance"
# }

// fungsinya bisa reusable (dalam case ini adalah image OS)
data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}

// membuat Service Account
# resource "google_service_account" "service_account" {
#   account_id   = "service-account-id"
#   display_name = "Service Account"
# }

// VM-1
resource "google_compute_instance" "vm-1" {
  name         = "my-instance-2"
  machine_type = "e2-micro"
  # cara panggil variable list
  # zone         = var.compute_zone[2]

  # cara panggil variable map
  zone = var.compute_zone["zone-3"]

  // mengizinkan VM berhenti dan update konfigurasi
  allow_stopping_for_update = var.allow_stop_vm

# lifecycle ini berfungsi ketika tidak sengaja mengapus semua resource instance (terraform destroy) ini tidak akan bisa terhapus denagn mendefinisikan lifecycle.
  lifecycle {
    prevent_destroy = true
  }
  
  boot_disk {
    initialize_params {
      // dari data source
      image = data.google_compute_image.my_image.self_link
    }
  }


  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }

}