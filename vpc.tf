provider "google" {
  project = "checkin-436517"  
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "dashathvpc"
  auto_create_subnetworks = false  # Set to true if you want auto-created subnets
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "my-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "all"
  }

  source_ranges = ["10.0.0.0/24"]
}
