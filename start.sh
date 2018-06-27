#!/bin/bash

sudo docker-compose up -d db
echo " ... wait for 10 seconds for db to start"
sleep 10
sudo docker-compose up -d api