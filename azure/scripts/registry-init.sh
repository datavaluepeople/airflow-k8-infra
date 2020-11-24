#!/bin/sh

# Initialise the container registry for the cluster

. ./azure/scripts/variables.sh

az acr create --resource-group $RG \
  --name $CONTAINERREGISTRY --sku Basic
