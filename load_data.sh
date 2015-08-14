#!/usr/bin/env bash

if  [ $# -eq 2 ]
then
    case $1 in
    hstool)
        docker cp $2 eeadockerflisservices_hstool_1:/horizon-scanning-tool/data.json
        docker exec eeadockerflisservices_hstool_1 python manage.py loaddata data.json
        exit
    ;;
    livecat)
        docker cp $2 eeadockerflisservices_livecat_1:/live_catalogue/data.json
        docker exec eeadockerflisservices_livecat_1 python manage.py loaddata data.json
        exitt
    ;;
    metadata)
        docker cp $2 eeadockerflisservices_metadata_1:/metadata/data.json
        docker exec eeadockerflisservices_metadata_1 python manage.py loaddata data.json
        exit
    ;;
    flip)
        docker cp $2 eeadockerflisservices_flip_1:/flip/data.json
        docker exec eeadockerflisservices_flip_1 python manage.py loaddata data.json
        exit
    ;;
    *)
        echo "No database named $1"
        exit
    ;;
    esac
else
     echo "Please input both database and data file"
     exit
fi
exit
