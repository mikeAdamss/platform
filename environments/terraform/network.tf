
# Subnet for pods
# for cidrs: https://mxtoolbox.com/subnetcalculator.aspx
resource "google_compute_subnetwork" "gke_subnet" {
  name          = format("subnet-%s", var.project_id)
  region        = var.region
  project       = var.project_id
  network       = google_compute_network.gke_vpc.id
  ip_cidr_range = "10.10.0.0/20"
  secondary_ip_range {
        range_name    = format("gke-pods-ip-range-%s", var.environment_label)
        ip_cidr_range = "10.10.16.0/21"
    }
  secondary_ip_range {
        range_name    = format("gke-services-ip-range-%s", var.environment_label)
        ip_cidr_range = "10.10.24.0/21"
    }
}

# VPC
resource "google_compute_network" "gke_vpc" {
  project                 = var.project_id
  name                    = format("vpc-%s", var.environment_label)
  auto_create_subnetworks = "false"
}