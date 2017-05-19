#!/bin/bash

sudo docker stop $(docker ps -a -q)

git submodule init
git submodule update

sudo docker-compose build
sudo docker-compose up -d

sudo docker run -d -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" portainer/portainer
