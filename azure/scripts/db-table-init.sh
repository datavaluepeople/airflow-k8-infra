#!/bin/sh

# Script that will print out the commands needed to provision the database
# and tables in the Postgres instance for airflow.
# You need to run the SQL commands once you have connected to the postgres instance.

. ./azure/scripts/variables.sh

# DBADMINPASS has to be a ENV variable not in the `variables.sh`
# `export DBADMINPASS=<pass>`
# `export DBAIRFLOWPASS=<pass>`
CSTR="host=${DBNAME}.postgres.database.azure.com port=5432 dbname=postgres user=${DBADMINUSER}@${DBNAME} password=${DBADMINPASS} sslmode=require"
CONNECTIONSTR="psql \"$CSTR\""


SQLSTR=$(cat << EOM
CREATE DATABASE ${DBAIRFLOWDB};\n
CREATE USER ${DBAIRFLOWDBUSER} WITH ENCRYPTED PASSWORD '${DBAIRFLOWPASS}'; \n
GRANT ALL PRIVILEGES ON DATABASE ${DBAIRFLOWDB} TO ${DBAIRFLOWDBUSER}; \n
EOM
)

echo "Connect to the server using (psql must be installed):"
echo $CONNECTIONSTR
echo "You need to run the sql command when on the server:"
echo $SQLSTR
echo "'\q' to quit. (in case you have forgoten)"
