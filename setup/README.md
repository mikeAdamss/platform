

## Setting Up Terraform Remote State On A New GCP Account

- 1.) `chmod ./build/terraform-remote-state.sh`.
- 2.) Make sure the correct gcloud account id is at the top of the script.
- 3.) Run it  will create a bucket on gcp that will contain shared states, this bucket name is the same as the project id.


**Example**:

The terraform to define application environments is contained within `/environments/terraform`.

The contents of `./environments/terraform/backend.tf` are as follows:

```
terraform {
 backend "gcs" {
   bucket  = "<PROJECT_ID>"
   prefix  = "environments
 }
}
```

## Spinning up a new envionment

Provided that you've configured or will be using an environments worth of configuration via  `terraform/vars/<ENV NAME>.ftvars` file and created an appropriate `environments/ansible/inventory` entry then a standard run of terraform followed by a standard run of ansible should fully provision and orchestrate an environment. See the appropriate `README`'s for how to setup and run them.

