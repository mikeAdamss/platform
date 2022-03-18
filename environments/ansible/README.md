# Ansible


## Setup

Setup Python Dependencies(within repo base)

- install [poetry](https://pypi.org/project/poetry/) if you haven't yet.
- `poetry install`
- `poetry shell`

Install Ansible Modules
- `ansible-galaxy collection install community.kubernetes`
- `ansible-galaxy collection install google.cloud:1.0.2`

**TODO: this next bit is messy/should be redundant, sort it out**

Setup kubectl cluster credentials:
- 1.) install [gcloud](https://cloud.google.com/sdk/docs/install-sdk) if you haven't yet.
- 2.) authorise your local machine with `gcloud auth login`
- 3.) install `kubectl` via gcloud `gcloud components install kubectl`
- 4.) use 1 to authorise 3 to a given cluster via:
    - `gcloud container clusters get-credentials <CLUSTER-NAME> --region <REGION>`

_Example cluster name `gke-trial`. It's always `gke-<ENVIONMENT_NAME>`._

## Usage

First, cd into this directory, then run the command:

`ansible-playbook -i ./inventory/trial.gcp.yml ./playbook.yml"`. Change `trial` to the name of the environment you are orchestrating - **IMPORTANT**, when you create a new dynamic inventory in `./inventory` be sure to change the filter name appropriately.

**Note: until I sort the TODO earlier on this document, you'll need to have authenticated kubectl with the cluster of the envionment you're specifying, as per baove section on "Setup kubectl cluster credentials".**

This command can also be used force the cluster to a compliant "all lights are green" state as a quick fix in the event of any issues or outages.
 