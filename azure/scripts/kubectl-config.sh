#!/bin/sh

# Configure the kubectl on the local machine so the newly created cluster
# will be used when `kubectl` is run.

. ./azure/scripts/variables.sh

az aks get-credentials --name $CLUSTERNAME --resource-group $RG

kubectl config use-context $CLUSTERNAME
