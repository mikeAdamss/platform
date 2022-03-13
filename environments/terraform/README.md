
# Terraform

## What is it?

Terraform is for declaratively provisioning infrastructure. A `remote state` outling the infrastructure _we currently have_ will already have been created and stored on GCP.

When you run terraform, it will compare that `remote state` to the `desired state` as outlined by the **.tf` files in this directory** and let you know what would infrastructure changes it would need to make to bring the remote state in line with the desired state - its then up to you to confirm the changes or not.  


## Setting up Terraform

1.) Install the `gcloud` cli.

2.) Authorise you local machine via `gcloud auth login`

3.) Install `terraform`

4.) If you dont have one, create a key to our GCP service account via `gcloud iam service-accounts keys create "${HOME}/.credentials/terraform_service_account.json" --iam-account "terraform@<PROJECT_ID>.iam.gserviceaccount.com"` (you can get the GCP project id from the dashboard or ask someone).

5.) Run the command `cat ${HOME}/.credentials/terraform.json | grep client_email` to get the service account cient email address. Specify this email with the environment variable `TF_VAR_terraform_service_account` (for terraform). 

6.) Point to the `terraform_service_account.json` file with the environment variable `GOOGLE_CREDENTIALS` (for ansible).

You can change the path as you need, **just don't put it anywhere that it could end up in git**.


## Using Terraform

- `cd terraform`
- `terraform init` (sets things up)

then one of:

- `terraform plan` (previews any changes required to bring remove state in line with what's defined by your terraform files).
- `terraform apply` (same as above but you can confirm and actully make the changes after the preview).
- `terrafor destroy` (remove all the resources specified by your terraform files, be sure you know what you're doing before you run this one).
