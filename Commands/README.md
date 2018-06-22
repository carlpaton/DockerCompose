# Compose

* docker-compose up
* docker-compose build --no-cache

# Cleanup

* sudo -i
* docker-compose rm
* docker rm $(docker ps -a -q)
* docker volume prune

* docker volume ls
* docker ps --all

# Volumes

* docker volume create compose_flyway_data:/var/opt/mssql/data
* sudo docker cp compose-flywaycopy:/data/ .
* sudo docker volume inspect compose_flyway_data

Mountpoint = /var/lib/docker/volumes/compose_flyway_data/_data

* sudo ls /var/lib/docker/volumes/compose_flyway_data/_data

# Manually Run Alpine (Copy Container)

* spin up docker container
docker run -i -v /test-vol --name=voltainer alpine:3.7 /bin/sh

* Update/Upgrade & install GIT
apk update
apk upgrade
apk add --no-cache bash git openssh

* Create/List directory
mkdir data
ls

* Clone GIT
git clone https://github.com/charleyza/SQLStatements.git data

* Copy to docker volume
cp data/ComposeDemo/*.sql /test-vol

* List installed packages
apk info

* Exit interactive session
CTRL D