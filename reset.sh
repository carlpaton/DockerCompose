#!/bin/bash

sudo docker container kill compose-angular-web
sudo docker rm compose-angular-web

sudo docker container kill compose-api
sudo docker rm compose-api

sudo docker container kill compose-db
sudo docker rm compose-db

sudo docker ps --all