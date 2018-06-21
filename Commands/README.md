# Cleanup

sudo -i
docker-compose rm
docker rm $(docker ps -a -q)
docker volume prune

docker volume ls
docker ps --all

# Volumes

docker volume create compose_flyway_data:/var/opt/mssql/data

sudo docker cp compose-flywaycopy:/data/ .

sudo docker volume inspect compose_flyway_data
* Mountpoint = 
* /var/lib/docker/volumes/compose_flyway_data/_data

sudo ls /var/lib/docker/volumes/compose_flyway_data/_data
sudo ls /var/lib/docker/volumes/