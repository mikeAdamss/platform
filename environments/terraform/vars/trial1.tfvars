environment_label = "trial1"
project_id = "stone-facility-343810"

# With networking, try to keep the convention of changing the
# leftmost digits per environment where we can, just to keep the mathamatics
# managable.
gke_subnet_ip_cidr_range = "10.10.0.0/20"
gke_pods_ip_range = "10.10.16.0/21"
gke_services_ip_range = "10.10.24.0/21"

# Kubernetes
node_max_count = 4
node_min_count = 1
node_initial_count = 2
node_disk_size = 10 # gb
zones = [
        "europe-west2-a"
    ]
region = "europe-west2"
node_locations = "europe-west2-a"
gke_node_machine_type = "e2-small"