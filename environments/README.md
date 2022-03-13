
# Environments

Infrastructure as code and documentnation for composable application environments.

We are defining an application environment as a distinct collection of infrastructure resources that:
 
- Are defined via a single collection of configurable infrastructure as code scripts (the contents of `./terraform` and `./ansible` in this instance).
- Has a shared naming, namepspace conventions and tags that is repeated through all components (e.g: a pre/post fix of "develop" for all components).
- Exists within and/or attached to a single VPC.
- All public resources will be accessible via a standardised sub domain variant (e.g develop.thing.api, staging.thing.api etc etc).


## How does it work?

If you look in `./terraform/vars/` you'll see (for example) a `develop.tfvars` that's holding the variables used to provision the develop environment. You can create as many alternations of this as you need (or want to pay for) environments. The readme inside of `./terraform` explains how to pass these variable files into a teraform run. 

If you look in `./ansaible/vars/` you'll see (for example) a `develop.json` that's holding the variables used to orchestrate the develop environment. You can create as many alternations of this as you need (or want to pay for) environments. The readme inside of `./ansible` explains how to pass these variable files into an ansible run.

## Usage

Look in the appropriate sub directories.