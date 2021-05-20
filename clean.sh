#!/bin/bash

if [[ $1 == 'full' ]]
then
    docker rm -f $(docker ps -aq)
    docker image rm -f $(docker image ls -aq)
else
    docker container rm nginx-container wordpress-container mariadb-container
    docker image rm nginx-container wordpress-container maria-container
fi