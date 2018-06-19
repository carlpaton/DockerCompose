#!/bin/bash
sudo docker pull alpine:3.7
sudo docker container kill flyway-dummy-container
sudo docker rm flyway-dummy-container

sudo docker rmi flyway_dummy_image
sudo docker build -t flyway_dummy_image .
sudo docker run -d --name flyway-dummy-container flyway_dummy_image

sudo docker start flyway-dummy-container