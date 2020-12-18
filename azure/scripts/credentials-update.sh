#!/bin/sh

# Update the credentials for the cluster.
# This is needed to apply changes to the permission for the service principal that the cluster uses

. ./azure/scripts/variables.sh

SP_ID=$(az aks show --resource-group $RG --name $CLUSTERNAME \
    --query servicePrincipalProfile.clientId -o tsv)
CURRENTEXPIREDATE=`az ad sp credential list --id $SP_ID --query "[].endDate" -o tsv`
echo "Current expiry date of cluster credential: $CURRENTEXPIREDATE"

echo "Updating the credentials in the cluster: $CLUSTERNAME"
SP_SECRET=`az ad sp credential reset --name $SP_ID --query password`

az aks update-credentials \
    --debug \
    --resource-group $RG \
    --name $CLUSTERNAME \
    --reset-service-principal \
    --service-principal "$SP_ID" \
    --client-secret $SP_SECRET

CURRENTEXPIREDATE=`az ad sp credential list --id $SP_ID --query "[].endDate" -o tsv`
echo "New expiry date of cluster credential: $CURRENTEXPIREDATE"

echo "
!!!!!!!!!
If error rerun: \n
az aks update-credentials \
    --debug \
    --resource-group $RG \
    --name $CLUSTERNAME \
    --reset-service-principal \
    --service-principal "$SP_ID" \
    --client-secret $SP_SECRET
"
