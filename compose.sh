#!/bin/bash

#reset.sh
docker-compose rm
docker rm $(docker ps -a -q)
docker volume prune

#build.sh
docker-compose build --no-cache

#up-start-db.sh
sudo docker-compose up -d db
echo " ... wait for 10 seconds for db to start"
sleep 10

#up.sh
docker-compose up