#!/bin/sh

# Variables that are used across all the scripts

# SUFFIX can be used to change the unique resource names.
# This is because some resources in azure have to be uniquely named
SUFFIX=103
CLUSTERNAME=airflowcluster
RG="airflowk8testing$SUFFIX"
LOCATION=uksouth
# max nods on the free tier
NODECOUNT=2

# Registry
CONTAINERREGISTRY=dvpairflowregistry
CUSTOMIMAGETAG=custom-airflow-image:1.0.0

# DB
DBNAME="pgairflow$SUFFIX"
DBADMINUSER=pgairflowadmin
DBAIRFLOWDB=airflowcluster1
DBAIRFLOWDBUSER=airflowcluster1

# storage
STORAGEACCOUNTNAME="dvpairflowstorage$SUFFIX"
DAGSHARE="dvpairflowstoragedags$SUFFIX"
LOGSHARE="dvpairflowstoragelogs$SUFFIX"

# IP
AIRFLOWWEBIPNAME=airflowStaticIP
