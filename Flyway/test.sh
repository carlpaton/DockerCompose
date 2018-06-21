#!/bin/bash
sudo docker pull alpine:3.7
sudo docker container kill compose-flywaycopy
sudo docker rm compose-flywaycopy

sudo docker volume create compose_flyway_data:/var/opt/mssql/data
sudo docker rmi flyway_dummy_image
sudo docker build -t flyway_dummy_image .
sudo docker run -d --name compose-flywaycopy flyway_dummy_image

sudo docker start compose-flywaycopy