
# Creates a version bucket on gcp that contains the shared terraform state

PROJECT_ID="stone-facility-343810"

# Create the remote backend bucket in Cloud Storage and the backend.tf file
# TODO: bucket region
gsutil mb -p ${PROJECT_ID} gs://${PROJECT_ID}

# Enable versioning for said remote bucket:
gsutil versioning set on gs://${PROJECT_ID}

# Enable apis that terraform will interact with
gcloud services enable compute.googleapis.com container.googleapis.com cloudresourcemanager.googleapis.com

# ----------------------
# Create service account
# ----------------------
gcloud iam service-accounts create terraform \
                            --project ${PROJECT_ID} \
                            --display-name "Terraform admin account" || true

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
            --member serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com \
              --role roles/viewer

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
            --member serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com \
            --role roles/storage.admin

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
            --member serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com \
            --role roles/compute.networkAdmin

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
            --member serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com \
            --role roles/iam.serviceAccountUser

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
            --member serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com \
            --role roles/iam.serviceAccountAdmin

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
            --member serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com \
            --role roles/compute.securityAdmin

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
            --member serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com \
            --role roles/container.clusterAdmin

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
            --member serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com \
            --role roles/logging.logWriter

## Create local service account key.
gcloud iam service-accounts keys create "${HOME}/.credentials/terraform.json" --iam-account "terraform@${PROJECT_ID}.iam.gserviceaccount.com"

## Remind peoplet to export an env var to point at these credentials
echo ""
echo "---- IMPORTANT ----"
echo "Credentials file created as: ${HOME}/.credentials/terraform.json"
echo "Please point to client email within this file with the env var GOOGLE_CREDENTIALS (for ansible)"
echo "Also specify the client email within the file with env var TF_VAR_terraform_service_account (for terraform)."
echo ""
echo "---- One Liner ----"
echo "export GOOGLE_CREDENTIALS=${HOME}/.credentials/terraform.json && export TF_VAR_terraform_service_account=${HOME}/.credentials/terraform.json"