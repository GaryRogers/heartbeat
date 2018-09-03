#!/bin/bash

NEW_SA_PASSWORD="Super_STRONG"
DOCKER_USERNAME="myusername" # May not be your email address

# docker login -u $DOCKER_USERNAME

docker build \
    --build-arg NEW_SA_PASSWORD=$NEW_SA_PASSWORD \
    ./db

#docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd \
#   -S localhost \
#   -U SA \
#   -P 'e:.PU,,^66:%ihk' \
#   -Q 'ALTER LOGIN SA WITH PASSWORD="$NEW_SA_PASSWORD"'