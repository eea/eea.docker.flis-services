FLIS Services Docker
=====================

This repo contains the orchestration setup for flis services. After successfully setting it up, it will expose a webserver that will serve:
* /flip - https://github.com/eea/flis.flip
* /live-catalogue - https://github.com/eea/flis.live-catalogue
* /hstool - https://github.com/eea/flis.horizon-scanning-tool
* /metadata - https://github.com/eea/flis.metadata

A PREFIX and a SERVER_NAME can be configured for different deployments.

Please check the env folder for a complete list of the variables that can be configured.

Prerequisites - System packages
-------------------------------

These packages must be installed : Docker, docker-compose


Create databases
--------------------


1. Create .env files in /env for every container


2. Start the containers in background:


    docker-compose up -d


3.1. Create MYSQL db:


    docker exec -ti eeadockerflisservices_dbsql_1 mysql --password=flis
    CREATE DATABASE hstool; CREATE DATABASE livecat; CREATE DATABASE metadata;
    exit


3.2. Create PostgreSQL db:


    docker exec -ti eeadockerflisservices_dbpost_1 su - postgres
    psql template1
    CREATE DATABASE flip;
    \q
    exit


4.1. Migrate changes for one database (and load common metadata if needed):


    ./migrate.sh <your_database>


4.2. Migrate changes for all databases:


    ./migrate.sh

4.3. Load data from sql dump:


    ./load_data.sh <your_database> <json dump file>
