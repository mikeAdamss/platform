
# Adminstration

Holding repo for useful admin tools and hacks. **This is intended for trouble shooting tips and tricks only**.

**IMPROTANT** - Some of this will let you interact with deployed clusters directly, **dont** change things, save in moments of extreme duress (as you're creating config drift). You should only be using `kubectl` to figure out _what_ the problem is or to hotfix an emergency "everything is on fire" live issue and then only where ansible has failed to do so.

Anything you change via `kubectl` (again, avoid that as much as possible) that you wish to make permenent should be reflected in an update to the infrastructure code asap and pr'd into this repo.


## Connecting to GKE clusters via kubectl

- 1.) install `gcloud`
- 2.) authorise your local machine with `gcloud auth login`
- 3.) install `kubectl` via gcloud `gcloud components install kubectl`
- 4.) use 1 to authorise 3 to a given cluster via:
    - `gcloud container clusters get-credentials <CLUSTER-NAME> --region <REGION>`


| Var | Description |
| ------------ | -----------|
| `<CLUSTER NAME>` | is baseed on the environment you're trying to access, it'll be a `gke-` prefix follow by the environment name, example: `gke-develop` |
| `<REGION>` | you can get from `variables.tf` (or from a .tfvars file if we're overriding the default). |

From this point your `kubectl` command is authorised to directly interact with your chosen GKE cluster.
 