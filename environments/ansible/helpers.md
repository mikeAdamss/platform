# Helpers

Some conveniences for helping with monitoring and administrating environments.

## Kubernetes

Since we're leaning on kubernetes a bit here I've added a `Makefile` to this directory that encapsulates some basic direct `kubectl`  and `helm` interactions to serve as a helper tool for monitoring and debugging. Run a naked `make` to see what you can do (feel free to add more helpers here - but remember its **monitoring only**, anything that modifies infrastructure should be encapsulated in code).

NOTE: In most instances you can also find the same (and more) information via exploring the intagrated GKE dashboard(s), the Makefile is a convenience.

GKE bashboard link: `https://console.cloud.google.com/kubernetes/list/overview?referrer=search&project=<PROJECT_ID>`

