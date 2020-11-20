# Airflow K8 infra

Repo under construction.

Will contain:
- helm chart that can be applied to a k8 cluster to bring up an airflow scheduler that can be used for running DAGs. DAGs, that use the kubernetes operators.
- scripts for different cloud providers that will create a cluster that the chart can be applied to. These scripts should be used for testing and development. Terraform should be used in production.
