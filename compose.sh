#!/bin/bash


#### reset.sh
#sudo docker container kill compose-angular-web
#sudo docker rm compose-angular-web
#sudo docker container kill compose-api
#sudo docker rm compose-api
#sudo docker container kill compose-db
#sudo docker rm compose-db
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
echo " ... wait for 5 seconds for db to start"
sleep 5
sudo docker-compose up -d api
echo " ... wait for 5 seconds for api to start"
sleep 5


#### flyway.sh
sudo docker-compose up -d baseline
echo " ... wait for 5 seconds for flyway baseline"
sleep 5
sudo docker-compose up -d migrate
echo " ... wait for 5 seconds for flyway migrate"
sleep 5


#### up.sh (runs attached)
docker-compose up


#### volume-display.sh
#echo "compose_flyway_git_data"
#ls /var/lib/docker/volumes/compose_flyway_git_data/_data
#echo ""
#echo "compose_flyway_data"
#ls /var/lib/docker/volumes/compose_flyway_data/_data
