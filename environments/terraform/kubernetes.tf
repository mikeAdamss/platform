
resource "google_container_cluster" "primary" {
  name       = "cluster-${var.environment_label}"
  location   = var.region
  network    = google_compute_network.gke_vpc.id
  subnetwork = google_compute_subnetwork.gke_subnet.id
  project    = var.project_id

  resource_labels = {
    "environment" : var.environment_label
  }

  ip_allocation_policy {
    # see netork.tf:google_compute_subnetwork.gke_subnet for definitions of following
    cluster_secondary_range_name  = "gke-pods-ip-range-${var.environment_label}"
    services_secondary_range_name = "gke-services-ip-range-${var.environment_label}"
  }

  # We can't create a cluster with no node pool defined, but we want to only use
  # our separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "environment_cluster_nodes" {
  name            = "node-pool-${var.environment_label}"
  location        = var.region
  node_locations  = var.zones
  cluster         = google_container_cluster.primary.name
  project         = var.project_id

  autoscaling {
    min_node_count = var.node_min_count
    max_node_count = var.node_max_count
  }
  node_count = var.node_initial_count

  node_config {
    machine_type = var.gke_node_machine_type
    disk_size_gb = var.node_disk_size

    labels = {
      "environment" : var.environment_label
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

  }
}