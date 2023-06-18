#!/bin/bash

echo -n "duffman" > ~/mysql_user
echo -n "saysoyeah" > ~/mysql_password
echo -n "SQLp4ss" > ~/mysql_root_password
echo -n "beer" > ~/mysql_database

podman secret create -d=file mysql_user ~/mysql_user
podman secret create -d=file mysql_password ~/mysql_password
podman secret create -d=file mysql_root_password ~/mysql_root_password
podman secret create -d=file mysql_database ~/mysql_database

podman run -d --name secretsdb \
        -p 3307:3306 \
        --secret mysql_user,type=env,target=MYSQL_USER \
        --secret mysql_password,type=env,target=MYSQL_PASSWORD \
        --secret mysql_root_password,type=env,target=MYSQL_ROOT_PASSWORD \
        --secret mysql_database,type=env,target=MYSQL_DATABASE \
        registry:5000/mariadb