#!/bin/sh

# Initialise the cluster

. ./azure/scripts/variables.sh

az aks create --resource-group $RG --name $CLUSTERNAME --node-count $NODECOUNT --enable-addons monitoring --generate-ssh-keys --attach-acr $CONTAINERREGISTRY
