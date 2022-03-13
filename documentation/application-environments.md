
# Application Environments

We are defining a application environment as:

A distinct collection of infrastructure resources that:
 
- Are defined via a single colldction of configurable infrastructure as code scripts.
- Has a shared naming, namepspace conventions and tags that is repeated through all components (e.g: a pre/post fix of "develop").
- Exists within and/or attached to a single VPC with all public resources accessible via a standardised sub domain variant (e.g develop.thing.api, staging.thing.api etc etc).
