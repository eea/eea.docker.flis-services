#!/usr/bin/env bash

if  [ $# -eq 2 ]
then
    case $1 in
    hstool)
        docker exec eeadockerflisservices_hstool_1 touch $2
        docker cp $2 eeadockerflisservices_hstool_1:/horizon_scanning/$2
        docker exec eeadockerflisservices_hstool_1 python manage.py loaddata $2
        docker exec eeadockerflisservices_hstool_1 rm -f /horizon_scanning/$2
        exit
    ;;
    livecat)
        docker exec eeadockerflisservices_livecat_1 touch $2
        docker cp $2 eeadockerflisservices_livecat_1:/live_catalogue/$2
        docker exec eeadockerflisservices_livecat_1 python manage.py loaddata $2
        docker exec eeadockerflisservices_livecat_1 rm -f /live_catalogue/$2
        exit
    ;;
    metadata)
        docker exec eeadockerflisservices_metadata_1 touch $2
        docker cp $2 eeadockerflisservices_metadata_1:/metadata/$2
        docker exec eeadockerflisservices_metadata_1 python manage.py loaddata $2
        docker exec eeadockerfilsservices_metadata_1 rm -f /metadata/$2
        exit
    ;;
    flip)
        docker exec eeadockerflisservices_flip_1 touch $2
        docker cp $2 eeadockerflisservices_flip_1:/flip/$2
        docker exec eeadockerflisservices_flip_1 python manage.py loaddata $2
        docker exec eeadockerflisservices_flip_1 rm -f /flip/$2
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
