# Platform

## Use Cases

### Use Case 1: Application Environments

We require symetrical environments for application deployments, e.g: a CMS _could_ need to be deployable into develop, production, test, staging etc, this means:

- envionments should be _utilising identical infrastucture components for parity_ however ... 
- resources scaling and the code version/branches being deployed should **not** be identical, e.g: you don't spin up a test environment with the same resources as a production one.

This means we need _composable environments_. So shared infrastructure as code definitions/process that can be nuanced for purpose via light per-environment configuration.

Simple put `infrastructure as code + configuration == environment`. 

The setup in `./environment` provides this facility. See the included readme's for more details.

### Use Case 2: Single Instance Infrastructure

There are some groupings of infrastructure components that we probably _don't_ want to deploy across multiple environments, some examples:

- software build pipelines.
- spikes and light deployments (example: The Solar System of Stats)
- (possibly) data pipelines, Jenkins etc.

These more light weight single use provision+orchestration stacks can also be defined within this repo via addng an appropriate sub directory (e.g`./data-pipelines`) with the approriate infrastructure code therein (see following information on stack).

**TODO: an example of this**.

## Stack

We are using three principle infrastructure as code tools.

### terraform
A state aware tool for declaratively provisioning infrastructure components from google cloud.

### ansible
An declarative orchestration tool that can interact directly with GCP infrastructure, for example: ensuring a specific sub set of our helm charts is deployed to a specific GKE cluster (i.e develop release of images are deployed to the develop gke server in the develop environment), or more broadly: ensuring thing A is installed in compute instance B, etc.

Simply put, while terraform will get you servers and cluster, its ansible that will do any required install and setup and put those servers and clusters into the desired _ready state_.

**Note:** it's important to understand that while this idea of a _ready state_ is required for provisioning (and syncronising) environments, it also means ansible can be used as a _very_ powerful disaster recovery or quick fix tool as we can _enforce_ that _ready_state_ on demand.


**helm**:
A tool for defining indivdual application deployments via kubernetes.


## Conventions

The terraform and ansible code is defined within appropriate sub directories of a given purpose (i.e for environments look in `./environments/terraform` and `./environments/ansible`).

We're currently defining the `helm` charts within a `helm` sub directory of the appropriate `/ansible` sub dierctories, this is purely a convenience for relatively referencing locally defined charts from within the ansible playbooks.


## Usage

Instructions on using the different parts of the stack are include via readmes in the appropriate sub directories.