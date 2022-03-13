# Ansible


## Setup

Setup Python Dependencies(within repo base)
- `poetry install`
- `poetry shell`

Install Ansible Modules
- `ansible-galaxy collection install community.kubernetes`
- `ansible-galaxy collection install google.cloud:1.0.2`

Make sure you have setup kubectl cluster credentials, via:
- 1.) install `gcloud`
- 2.) authorise your local machine with `gcloud auth login`
- 3.) install `kubectl` via gcloud `gcloud components install kubectl`
- 4.) use 1 to authorise 3 to a given cluster via:
    - `gcloud container clusters get-credentials <CLUSTER-NAME> --region <REGION>`


## Usage

First, cd into this directory, then run the command:

`ansible-playbook ./playbook.yml --extra-vars "@./vars/<THIS ENVIRONVMENT>.json"`

This will ensure all services as defined in the `ansible_role_list` of `<THIS ENVIRONVMENT>.json` are orcestrated within the environment in question.

The "roles" therein are contained within `./roles`, the helm charts that (some of them) made use of are contained with `./helm`.

This command can also be used force the cluster to a compliant "all lights are green" state as a quick fix in the event of any issues or outages.