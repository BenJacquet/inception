#! /bin/bash

mysqld_safe &

sleep 5

mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown

mysqld_safe --user=root --password=$MYSQL_ROOT_PASSWORD