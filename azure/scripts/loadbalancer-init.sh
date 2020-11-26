#!/bin/sh

# Script to create a loadbalancer that can be used by the cluster.

. ./azure/scripts/variables.sh

echo "Creating public ip that can be set to the web app of airflow:"
az network public-ip create \
    --resource-group $RG \
    --name $AIRFLOWWEBIPNAME \
    --sku Standard \
    --allocation-method static

AIRFLOWWEBIP=`az network public-ip show --resource-group $RG --name $AIRFLOWWEBIPNAME --query ipAddress --output tsv`

if [ -z ${SPCLIENTID+x} ]; then
  SPCLIENTID=`az aks show --name $CLUSTERNAME -g $RG --query "servicePrincipalProfile.clientId" -o tsv`
fi

SCOPE=`az group show -g $RG --query "id" -o tsv`

az role assignment create \
    --assignee $SPCLIENTID \
    --role "Network Contributor" \
    --scope $SCOPE

echo "Airflow web ip: $AIRFLOWWEBIP Set this in custom-values.yaml"
echo "If this is run after the creation of the cluster you will need to run 'credentials-update.sh'"
