FLIS Services Docker
=====================



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
