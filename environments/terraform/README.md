
# Terraform

## What is it?

Terraform is for declaratively provisioning infrastructure. A `remote state` outling the infrastructure _we currently have_ will already have been created and stored on GCP.

When you run terraform, it will compare that `remote state` to the `desired state` as outlined by the **.tf` files in this directory** and let you know what would infrastructure changes it would need to make to bring the remote state in line with the desired state - its then up to you to confirm the changes or not.  


## Setting up Terraform

1.) Install the [gcloud](https://cloud.google.com/sdk/docs/install-sdk) cli.

2.) Authorise you local machine via `gcloud auth login`

3.) Install `terraform`

4.) If you dont have one, create a key to our GCP service account via `gcloud iam service-accounts keys create "${HOME}/.credentials/terraform_service_account.json" --iam-account "terraform@<PROJECT_ID>.iam.gserviceaccount.com"` (you can get the GCP project id from the dashboard or ask someone).

4.) Point to the `terraform_service_account.json` file by exporting the environment variable `GCP_SERVICE_ACCOUNT_FILE`.

You can change the path as you need, **just don't put it anywhere that it could end up in git**.


## Using Terraform

- `cd terraform`
- `terraform init` (sets things up)

### Setting your workspace

`Terraform` has a concept of `workspace` that allows you to logically separate infastructure groups recorded in the same remote state. For example, you can have a `develop` workspace and a `production` workspace and any terraform runs while "in" `develop` would ignore all infrastrcture in `production` and vice versa.

For our purposes we're using **one workspace per distinct environment**. In terms of usage:

- `terraform workspace list`, lists the availble workspaces with an asterix against the currently active one.
- `terraform workspace select <WORKSPACE>` (where WORKSPACE is the workspace name, eg "trial1") activates a single workspace.

Always be sure to select the correct workspace when managing infrastrcture environments. As a rule of thumb, if you have unexpected changes on your preview, this is the first thing that you should check.

### Running Terraform

_I'm assuming we're setting up the "trial" environment here, change as needed._

- `terraform plan -var-file="./vars/trial1.tfvars"` (previews any changes required to bring remove state in line with what's defined by your terraform files).
- `terraform apply -var-file="./vars/trial1.tfvars"` (same as above but you can confirm and actully make the changes after the preview).
- `terrafor destroy -var-file="./vars/trial1.tfvars"` (remove all the resources specified by your terraform files, be sure you know what you're doing before you run this one).
