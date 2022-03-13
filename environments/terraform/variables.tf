
variable "project_id" {
  description = "The gcp project id in question"
  type        = string
  default     = "stone-facility-343810"
}

variable "environment_label" {
  description = "The name of the envionment being provisioned"
  type        = string
  default     = "develop"
}

variable "gke_node_machine_type" {
  description = "The gcp project id in question"
  type        = string
  default     = "e2-small"
}

variable "node_locations" {
  description = "Locations for nodes"
  type        = string
  default     = "europe-west2-a"
}

variable "region" {
    description = "Region"
    type        = string
    default     = "europe-west2"
}

variable "zones" {
    description = "Zones"
    type        = list(string)
    default     = [
        "europe-west2-a"
    ]
}

variable "node_disk_size" {
    description = "Per node hard disk size"
    type        = number
    default     = 10 # gb
}

variable "node_initial_node_count" {
    description = "How many nodes does the cluster have when first spun up"
    type        = number
    default     = 2
}

variable "node_min_count" {
    description = ""
    type        = number
    default     = 1
}

variable "node_max_count" {
    description = ""
    type        = number
    default     = 4
}

variable "terraform_service_account" {
    description = "Terraform managed service account email"
    type = string
}