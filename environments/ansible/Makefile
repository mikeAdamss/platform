# Helpers for interacting directly with a cluster running on GKE with kubctl
REGION := "europe-west2"
.PHONY: all

# Shellscript hack that'll give us a "help menu" if you do a naked `make`.
# note: it'll pick up and echo the '##' commented lines below
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


describe_service: ## use kubectl to describe a service, takes service name as s=<SERVICE>, use which_serivce for names 
	kubectl describe $(s)

env: ## activate the poetry shell in the root repo
	cd ../.. && poetry shell && cd ./environments/ansible

auth: ## sets your kubctl to activate credentials for the cluster of a specific environment. Usage `make env=<ENV> auth`
	echo "NOTE: Uses our default region: $(REGION), to change this you'll need to alter the Makefile"
	gcloud container clusters get-credentials cluster-$(env) --region $(REGION)

ingress_ip: ## display ip information for the ingress ip
	kubectl get ing -n ingress

ingress_describe: ## basic information about the nginx ingress controller
	kubectl describe ing nginx-ingress-controller -n linked-data-repository

# TODO: make into one runabale command
ingress_logs: ## view the lgos from the ingress controller
	@echo "----DESCRIPTON ONLY: YOU'LL NEED TO RUN THE COMMANDS ---"
	@echo kubectl get pods -n ingress
	@echo "kubectl logs -n ingress <a service from the NAME column from previous command>"
	@echo "--------------------------------------------------------"

which_env: ## displays which context you've got activated (synonymous with "environment" in this case - see end of second line printed)
	kubectl config current-context

which_charts: ## list all helm charts availible to the kubernetes cluster
	helm list --all-namespaces

which_pods: ## displays pods running in the current context
	kubectl get pods --all-namespaces

which_pods_detailed: ## more detailed display of pods running in the current context
	kubectl get pods --all-namespaces -o wide

which_services: ## displays services running in the current context
	kubectl get service
