#!/bin/sh

# Initialise the azure resources

. ./azure/scripts/variables.sh
az group create --name $RG --location $LOCATION
