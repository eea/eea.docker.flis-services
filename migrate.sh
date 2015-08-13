#!/usr/bin/env bash

case $1 in

hstool)
    docker exec eeadockerflisservices_hstool_1 python ./manage.py migrate
    docker exec eeadockerflisservices_hstool_1 python ./manage.py loadfixtures
    docker exec eeadockerflisservices_hstool_1 python ./manage.py load_metadata_fixtures
;;
livecat)
    docker exec eeadockerflisservices_livecat_1 python ./manage.py migrate
;;
metadata)
    docker exec eeadockerflisservices_metadata_1 python ./manage.py migrate
;;
flip)
    docker exec eeadockerflisservices_flip_1 python ./manage.py migrate
    docker exec eeadockerflisservices_flip_1 python ./manage.py loadfixtures
    docker exec eeadockerflisservices_flip_1 python ./manage.py load_metadata_fixtures
;;
*)
    docker exec eeadockerflisservices_hstool_1 python ./manage.py migrate
    docker exec eeadockerflisservices_hstool_1 python ./manage.py loadfixtures
    docker exec eeadockerflisservices_hstool_1 python ./manage.py load_metadata_fixtures
    docker exec eeadockerflisservices_livecat_1 python ./manage.py migrate
    docker exec eeadockerflisservices_metadata_1 python ./manage.py migrate
    docker exec eeadockerflisservices_flip_1 python ./manage.py migrate
    docker exec eeadockerflisservices_flip_1 python ./manage.py loadfixtures
    docker exec eeadockerflisservices_flip_1 python ./manage.py load_metadata_fixtures
;;
esac

exit
