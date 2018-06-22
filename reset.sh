#!/bin/bash
docker-compose rm
docker rm $(docker ps -a -q)
docker volume prune

docker volume ls
docker ps --all