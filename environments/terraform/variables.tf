
variable "project_id" {
  description = "The gcp project id in question"
  type        = string
  default     = "stone-facility-343810"
}

variable "environment_label" {
  description = "The name of the envionment being provisioned"
  type        = string
}

variable "gke_node_machine_type" {
  description = "The gcp project id in question"
  type        = string
}

variable "node_locations" {
  description = "Locations for nodes"
  type        = string
}

variable "region" {
    description = "Region"
    type        = string
}

variable "zones" {
    description = "Zones"
    type        = list(string)
    default     = [
    ]
}

variable "node_disk_size" {
    description = "Per node hard disk size"
    type        = number
}

variable "node_initial_node_count" {
    description = "How many nodes does the cluster have when first spun up"
    type        = number
}

variable "node_min_count" {
    description = ""
    type        = number
}

variable "node_max_count" {
    description = ""
    type        = number
}

variable "terraform_service_account" {
    description = "Terraform managed service account email"
    type = string
}