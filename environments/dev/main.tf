resource "google_compute_instance" "vm" {
    name = "tf-vm"
    machine_type = "e2-micro"
    project = var.project_id
    zone = var.zone

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    network_interface {
        network = "default"
        access_config {}
    }
}

resource "google_storage_bucket" "bucket" {
    name = "tf-bucket-${var.project_id}"
    location = var.region
    project = var.project_id
    force_destroy = true
    uniform_bucket_level_access = true
    versioning {
        enabled = true
    }

}