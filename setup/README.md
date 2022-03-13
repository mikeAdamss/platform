

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
   bucket  = "stone-facility-343810"
   prefix  = "environments
 }
}
```




    - b.) will output `../../terraform/backend.tf` which tells terraform where to look for said state on gcp.

**IMPORTANT** - doing this will override the contents of `../terraform/backend.tf` (the thing that defines _which_ bucket worth of teraform remote state you're connecting to). This will need to be accounted for if we ever try and run multiple accounts from the same branch.

## Spinning up a new envionment

Provided that you've configured or will be using an environments worth of configuration, consisting of:
    
- (1) An appropriate `terraform/vars/<ENV NAME>.ftvars` file.
- (2) An appropraite `ansible/vars/<ENV NAME>.json` file.
- (3) Per-application helm charts in `ansible/helm/<ENV NAME>/*`

Then a standard run of terraform followed by a standard run of ansible should fully provision an environment. See the appropriate `README`'s for how to setup and run them.

