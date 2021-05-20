#!/bin/bash

if [[ $1 == 'nginx' ]]
then
    docker build -t nginx-container ./srcs/nginx
    docker run --name nginx-container -it nginx-container
elif [[ $1 == 'wp' ]]
then
    docker build -t wordpress-container ./srcs/wordpress
    docker run --name wordpress-container -it wordpress-container
elif [[ $1 == 'pma' ]]
then
    docker build -t pma-container ./srcs/phpmyadmin
    docker run --name pma-container -it pma-container
elif [[ $1 == 'ftps' ]]
then
    docker build -t ftps-container ./srcs/ftps
    docker run --name ftps-container -it ftps-container
elif [[ $1 == 'db' ]]
then
    docker build -t mariadb-container ./srcs/mariadb
    docker run --name mariadb-container -it mariadb-container
elif [[ $1 == 'influx' ]]
then
    docker build -t influxdb-container ./srcs/influxdb
    docker run --name influxdb-container -it influxdb-container
elif [[ $1 == 'grafana' ]]
then
    docker build -t grafana-container ./srcs/grafana
    docker run --name grafana-container -it grafana-container
fi
