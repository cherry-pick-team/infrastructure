#!/bin/bash

sudo docker-compose build
sudo docker-compose stop
sudo docker-compose up -d
