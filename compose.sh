#!/bin/bash


#### reset.sh
docker-compose rm
docker rm $(docker ps -a -q)
docker volume prune
#docker volume ls
#docker ps --all


#### build.sh
docker-compose build --no-cache


#### up-start-db.sh
sudo docker-compose up -d db
#docker-compose logs -f #watch logs
echo " ... wait for 10 seconds for db to start"
sleep 10


#### up.sh (runs attached)
docker-compose up


#### volume-display.sh
#echo "compose_flyway_git_data"
#ls /var/lib/docker/volumes/compose_flyway_git_data/_data
#echo ""
#echo "compose_flyway_data"
#ls /var/lib/docker/volumes/compose_flyway_data/_data