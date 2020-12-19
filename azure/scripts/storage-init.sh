#!/bin/sh

# Initialise the storage volumes for the cluster

. ./azure/scripts/variables.sh
# Create the storage account
if ( `az storage account check-name --name $STORAGEACCOUNTNAME --query 'nameAvailable'` == "true" );
then
    echo "Creating $STORAGEACCOUNTNAME storage account..."
    az storage account create -g $RG -l $LOCATION \
    --name $STORAGEACCOUNTNAME \
    --sku Standard_LRS \
    # This encryption has been commented as this can take a long time to initialise so you might not receive a response if used...
    #    --encryption-services blob
    echo "Storage account $STORAGEACCOUNTNAME created."
else
    echo "Storage account $STORAGEACCOUNTNAME exists..."
fi

# Retrieve the storage account key
echo "Retrieving storage account key..."
ACCOUNT_KEY=$(az storage account keys list --resource-group $RG --account-name $STORAGEACCOUNTNAME --query [0].value -o tsv)
echo "Storage account key retrieved."

az storage share create \
    --account-name $STORAGEACCOUNTNAME \
    --account-key "$ACCOUNT_KEY" \
    --name $DAGSHARE \
    --quota 1024

az storage share create \
    --account-name $STORAGEACCOUNTNAME \
    --account-key "$ACCOUNT_KEY" \
    --name $LOGSHARE \
    --quota 1024

echo "Storage account: $STORAGEACCOUNTNAME, Account Key: $ACCOUNT_KEY"
