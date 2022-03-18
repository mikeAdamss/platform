terraform {
 backend "gcs" {
   bucket  = "stone-facility-343810"
   prefix  = "terraform-state/environments"
 }
}
