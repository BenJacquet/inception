#! /bin/bash

#attendre le demarrage de mysqld
sleep 10

#creation de l'utilisateur, base de donnees et modification du mot de passe root
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

#injection de la base de donnees
mysql -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < database.sql

