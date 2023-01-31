#!/bin/bash

docker create --name creatd nginx
docker run -d --name up -p 8080:80 nginx
docker run -d --name paused -p 8081:80 nginx
docker run -d --name restrt -p 8082:80 --restart always ubuntu
docker run -d --name exited -p 8083:80 nginx

docker pause paused
docker stop exited
docker exec -it restrt bash -c exit

docker ps -a --format '{{.Names}} \t {{.Status}}'
