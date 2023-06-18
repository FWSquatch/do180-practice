# Introduction

The original sample exam did not have questions for all topics on the 2023 EX188 exam. 

This document adds a few missing topics. 


# Extra tasks

## Task 8

Use the MariaDB container from task 3. 

Refactor your configuration in such a way that you create four Podman secrets:

* mysql_user: "duffman", from file ~/mysql_user
* mysql_password: "saysoyeah", from file ~/mysql_password
* mysql_root_password: "SQLp4ss", from file ~/mysql_root_password
* mysql_database: "beer", from file ~/mysql_database

Run the container in the background, with the following parameters:

* You will again use the image "mariadb" from the registry on registry.do180.lab.
* Give the container the name secretsdb.
* Publish port 3306 on external port 3307.
* The variables for database startup should be set as secret environment variables.
  * MYSQL_USER
  * MYSQL_PASSWORD
  * MYSQL_ROOT_PASSWORD
  * MYSQL_DATABASE

Once the container is up and running, prove that your settings are correctly applied.

Connect to your database as the root user and check for the existence of the beer database:

`echo "show databases;" | mysql -uduffman -h 192.168.88.4 -psaysoyeah`

Run the command located in /sql/beer.sql to insert values into the database.

`mysql -uroot -h 192.168.88.4 -pSQLp4ss < /sql/beer.sql`


## Task 9

**Note:**

> This task heavily leans on the Docker Samples project's _Voting App_. 

Use the incomplete Podman Stack file located in /dockerfiles/voting/docker-compose.yml. Use the comments in the file to guide you through the process of creating a Podman Stack with the following requirements:

* There are two networks: front-end (of type bridge) and back-end (of type internal).
* There is one volume: db-data

The Stack consists of five services:

* Using the "redis" image, named "redis", in network "front-end"
* Using the "postgres:9.4" image, named "db", in network "back-end", with volume "db-data" mounted on /var/postgres.
* The Postgres container needs to have two environment variables: POSTGRES_USER and POSTGRES_PASSWORD, both set to "postgres". 
* Using the "voting-app" image, named "vote", in networks "back-end" and in "front-end". 
* The "vote" container exposes port 5000 on public port 5000. It depends on "redis". 
* Using the "result" image, named "result", in networks "back-end" and in "front-end". 
* The "vote" container exposes port 5001 on public port 5001. It depends on "db". 
* Using the "worker" image, named "worker", in networks "back-end" and "front-end". 
* The "worker" container depends on both "db" and "redis". 