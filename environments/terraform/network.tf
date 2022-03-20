
# Subnet for pods
# for cidrs: https://mxtoolbox.com/subnetcalculator.aspx
resource "google_compute_subnetwork" "gke_subnet" {
  name          = "subnet-${var.environment_label}"
  region        = var.region
  project       = var.project_id
  network       = google_compute_network.gke_vpc.id
  ip_cidr_range = var.gke_subnet_ip_cidr_range
  secondary_ip_range {
    range_name    = "gke-pods-ip-range-${var.environment_label}"
    ip_cidr_range = var.gke_pods_ip_range
  }
  secondary_ip_range {
    range_name    = "gke-services-ip-range-${var.environment_label}"
    ip_cidr_range = var.gke_services_ip_range
  }
}

# VPC
resource "google_compute_network" "gke_vpc" {
  project                 = var.project_id
  name                    = "vpc-${var.environment_label}"
  auto_create_subnetworks = "false"
}