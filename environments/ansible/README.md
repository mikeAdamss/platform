# Ansible

Setup Python Dependencies
- `poetry install`
- `postry shell`

Install Ansible Modules
- `ansible-galaxy collection install community.kubernetes`
- `ansible-galaxy collection install google.cloud:1.0.2`

Make sure you have setup kubectl cluster credentials as per:
`administration/README.md` , "Connecting to GKE clusters via kubectl".

Have the terraform service account exported (see `/terraform/README.md`).

Then run the command:

`ansible-playbook ./kubernetes_deployments.yml --extra-vars "@./vars/<THIS ENVIRONVMENT>.json"`

This will ensure all services as defined in `./roles/<THIS ENVIRONEMNT>/*` are deployed and running in the appropriate cluster.

This command can also be used force the cluster to a compliant "all lights are green" state as a quick fix in the event of any issues or outages.