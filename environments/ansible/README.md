# Ansible

## A Note On Yaml

`Ansible` and `Kubernetes` both use yaml for declarative purposes but are very different things under the hood.

Please maintain the convention of helm charts and resources (the kubernetes flavoured yaml) in `./helm` and `./resources` respectively and keep the ansible yaml files (beyond the root playbook) within `./ansible`.

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
- 3.) install `kubectl` via gcloud `gcloud components install kubectl` if you haven't yet.
- 4.) run `make env=<ENV> auth` where `ENV` is the environment you wish to interact with, i.e "trial1".

## Usage

First, cd into this directory, then run the command:

`ansible-playbook -i ./inventory/trial1.gcp.yml ./playbook.yml"`. Change `trial1` to the name of the environment you are orchestrating.

**Note: until I sort the TODO earlier on this document, you'll need to have authenticated kubectl with the cluster of the environment you're specifying, as per above section on "Setup kubectl cluster credentials".**

This command can also be used to (likely, though depending on the underlying issue) force an enviromments worth of infrastructure to a compliant "all lights are green" state as a quick fix in the event of any issues or outages.
 

 ## How it works

The subset of out infrastructure you're running ansible against is defined within the relevent `./inventory` file. The approach is to filter by the environment label applied to each infrastructure component (these labels are by terraform during provisioning).

When `playbook.yml` is called against this subset of infrastructure it will run each of the sets of instructions (roles) listed within.

If you drill into the appropriate sub directory in `./roles` you'll get to the `main.yml` defining what's actually happening when that role is called.

The key point is that this yml is really just a wrapper for underlying python functions. As a rough guide, the line beneath `- name:` is the name of a function, everything after is `**kwargs` passed to this function.

Beyond that, ansible is very well documented resource, with information on indovidual modeules availible here: [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/debug_module.html](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/debug_module.html)
