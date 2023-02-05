resource "google_compute_network" "vpc_network" {
  name                    = "vpc"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "general_rule" {
  name        = "general-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow ssh, icmp and user connection ports"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "3000"]
  }

  target_tags   = ["demoapp", "moni"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "prometheus-rule" {
  name        = "prometheus-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow ssh, icmp and user connection ports"

  allow {
    protocol = "tcp"
    ports    = ["9090"]
  }

  target_tags   = ["moni"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "demoapp-exporters-rule" {
  name        = "demoapp-exporters-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow ssh, icmp and user connection ports"

  allow {
    protocol = "tcp"
    ports    = ["8080", "9100"]
  }

  target_tags = ["demoapp"]
  source_tags = ["moni"]
}
