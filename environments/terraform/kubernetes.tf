# https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest

# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = format("gke-%s", var.environment_label)
  region                     = var.region
  zones                      = var.zones
  network                    = google_compute_network.gke_vpc.name
  subnetwork                 = google_compute_subnetwork.gke_subnet.name
  ip_range_pods              = format("gke-pods-ip-range-%s", var.environment_label)
  ip_range_services          = format("gke-services-ip-range-%s", var.environment_label)
  http_load_balancing        = true
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  cluster_resource_labels    = {
      environment = var.environment_label
  }
  create_service_account     = false

  node_pools = [
    {
      name                      = format("default-node-pool-%s", var.environment_label)
      machine_type              = var.gke_node_machine_type
      node_locations            = var.node_locations
      min_count                 = var.node_min_count
      max_count                 = var.node_max_count
      local_ssd_count           = 0
      disk_size_gb              = var.node_disk_size
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      preemptible               = false
      initial_node_count        = var.node_initial_node_count
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = format("node-pool-%s", var.environment_label)
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = format("default-node-pool-%s", var.environment_label)
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      format("default-node-pool-%s", var.environment_label),
    ]
  }
}
