#!/bin/sh

podman pull registry.do180.lab:5000/mariadb

podman run -d \
        --name testql \
        -p 3306:3306 \
        -e MYSQL_USER=duffman \
        -e MYSQL_PASSWORD=saysoyeah \
        -e MYSQL_ROOT_PASSWORD=SQLp4ss \
        -e MYSQL_DATABASE=beer \
        registry.do180.lab:5000/mariadb

echo "show databases;" | mysql -uduffman -h 192.168.88.4 -psaysoyeah

mysql -uroot -h 192.168.88.4 -pSQLp4ss < /sql/beer.sql
