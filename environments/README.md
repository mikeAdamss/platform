
# Environments

Infrastructure as code and documentation for composable application environments.

We are defining an application environment as a distinct collection of infrastructure resources that:
 
- Are defined via a single collection of configurable infrastructure as code scripts (the contents of `./terraform` and `./ansible` in this instance) that create a single distinct envionment for the purpose of running services online.
- Has a shared naming, namepspace convention and labelling process that is repeated through all components, so disparate components are all logically grouped and groupable on our GCP account.
- Exists within and/or is attached to resources that are attached to a single VPC.
- Has public resources will be accessible via standardised sub domain variants (e.g api.develop.foo, api.staging.foo etc etc).


## How does it work?

If you look in `./terraform/vars/` you'll see (for example) a `trial1.tfvars` that's holding the variables used to provision a trial environment used for platform development/trialling. You can create as many variations of this single file input as you need (or want to pay for) environments, this configuration allows you to nuance environment resources based on purpose (for example, a cluster in a production environment would likely have significantly more RAM, cpu and nodes than that of a test envionment). The readme inside of `./terraform` explains how to pass a variable file into a teraform run. 

When this environment is created, the infrastructure resources within are labelled according to their environment. This allows us to run `ansible` against a single, specific envionments worth of resources to create our `ready state`. Guidance for this is included via a readme in `./ansible`.

## Usage

Look in the appropriate sub directories. When creating a new environment (or recreating one you've previously torn down) you'll need to always run terraform before ansible.

## Adding a new application

A walkthrough of how to add a new applicaton to a running kubernetes clusters can be viewing in `./adding-applications.md`.

## Helpers

I've added some basic information for helping with monitoring and debugging a deployed envionments worth of infrastructure. Please see `./ansible/helpers.md`.