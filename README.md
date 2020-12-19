# Airflow K8 infra

Airflow stable chart was added:
```
helm repo add airflow-stable https://airflow-helm.github.io/charts
helm repo update
helm pull airflow-stable/airflow -d airflow-stable --untar
```

Current version of chart: airflow-7.14.3

For each platform please see README.
- azure: [`azure/README.md`](azure/README.md)
