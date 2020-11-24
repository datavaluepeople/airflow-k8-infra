# Airflow deployment on Azure

Under construction!

The azure airflow deployment on k8 includes:

### `custom-values.yaml`
Configuration for the airflow-stable helm chart in parent directory. Based on `airflow-stable/airflow/values.yaml`.

### `scripts`
Bash scripts to configure the infrastructure for azure. These use the `az` CLI tool so you need to configure the tool on you local machine to run the scripts.
These scripts should by used for development and testing. In a production environment terraform should be used.

### `k8s_resources_example`
Example configuration files that contain secrets and scripts. These should be copied and filled in by hand and then applied to the cluster.

# Run

Change `variable.sh` as needed.

Run script in order:
- `./azure/scripts/init.sh`
- `./azure/scripts/registry-init.sh`
- `./azure/scripts/cluster-init.sh`
- `./azure/scripts/kubectl-config.sh`


To delete: `./azure/scripts/cleanup.sh`

If you need to use the variables for another command:
`. ./azure/scripts/variables.sh`
The variables will then be added to the ENV of that bash session.


## Initialise secrets and configurations for the cluster
There are some secrets and configurations that should be added to the cluster.
These files are based on the files in `airflow-stable/airflow/examples/google-gke/k8s_resources/`.

Use the files in `k8s_resources_example` as a template.
- copy the folder: `cp -r azure/k8s_resources_example azure/k8s_resources` (azure/k8s_resources/ is ignored)
- file our the config files by hand
- apply the config to the cluster: `kubectl apply -f azure/k8s_resources`. !! Needs to be run twice as namespace not found on first pass !!
