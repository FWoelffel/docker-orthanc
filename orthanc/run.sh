#!/bin/bash
set -e
# Updating configuration
CONFIG=/etc/orthanc/orthanc.json
cp /default_orthanc.json $CONFIG
sed "s/\"Host\" : \"REPLACE-PGSQL\"/\"Host\" : \"$POSTGRESQL_PORT_5432_TCP_ADDR\"/" -i $CONFIG
sed "s/\"Port\" : \"REPLACE-PGSQL\"/\"Port\" : \"$POSTGRESQL_PORT_5432_TCP_PORT\"/" -i $CONFIG
sed "s/\"Database\" : \"REPLACE-PGSQL\"/\"Database\" : \"$POSTGRESQL_DB\"/" -i $CONFIG
sed "s/\"Username\" : \"REPLACE-PGSQL\"/\"User\" : \"$POSTGRESQL_USER\"/" -i $CONFIG
sed "s/\"Password\" : \"REPLACE-PGSQL\"/\"Password\" : \"$POSTGRESQL_PASSWORD\"/" -i $CONFIG

# Starting Orthanc
exec Orthanc --config=$CONFIG
