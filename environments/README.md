
# Environments

Infrastructure as code and documentnation for composable application environments.

We are defining an application environment as a distinct collection of infrastructure resources that:
 
- Are defined via a single collection of configurable infrastructure as code scripts (the contents of `./terraform` and `./ansible` in this instance).
- Has a shared naming, namepspace conventions and tags that is repeated through all components (e.g: a pre/post fix of "develop" for all components).
- Exists within and/or attached to a single VPC.
- All public resources will be accessible via a standardised sub domain variant (e.g develop.thing.api, staging.thing.api etc etc).


## How does it work?

