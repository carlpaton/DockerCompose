#!/bin/bash

sudo docker-compose up -d db
echo " ... wait for 5 seconds for db to start"
sleep 5
sudo docker-compose up -d api
echo " ... wait for 5 seconds for api to start"
sleep 5