#!/bin/sh

# Clean up all the azure resources

. ./azure/scripts/variables.sh
az group delete --name $RG
