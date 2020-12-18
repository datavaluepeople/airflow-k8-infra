#!/bin/sh

# Script to upload the dags to the shared storage.

. ./azure/scripts/variables.sh

# Retrieve the storage account key
echo "Retrieving storage account key..."
ACCOUNT_KEY=$(az storage account keys list --resource-group $RG --account-name $STORAGEACCOUNTNAME --query [0].value -o tsv)
echo "Storage account key retrieved."

SOURCE_PATH="$(pwd)/dags"

echo "Uploading from $SOURCE_PATH to $DAGSHARE"
az storage file upload-batch \
    --account-name $STORAGEACCOUNTNAME \
    --account-key "$ACCOUNT_KEY" \
    --destination  $DAGSHARE \
    --source $SOURCE_PATH
