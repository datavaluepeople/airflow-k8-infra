
#!/bin/sh

# Create the postgres instance.

. ./azure/scripts/variables.sh

# DBADMINPASS has to be a ENV variable not in the `variables.sh`
# `export DBADMINPASS=<pass>`
# `export IPADDRESS=<pass>`

az postgres server create --resource-group $RG --name $DBNAME \
  --location $LOCATION --admin-user $DBADMINUSER --admin-password $DBADMINPASS --sku-name GP_Gen5_2 --ssl-enforcement Enabled


az postgres server firewall-rule create --resource-group $RG --server $DBNAME --name AllowMyIP --start-ip-address $IPADDRESS --end-ip-address $IPADDRESS
