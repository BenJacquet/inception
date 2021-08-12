#! /bin/bash

mysqld_safe &

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};"
mysql -e "CREATE USER IF NOT EXISTS ${WORDPRESS_DB_USER}@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO ${WORDPRESS_DB_USER}@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';"

mysqladmin shutdown

exec mysqld_safe #--user=root -p $ROOT_PASSWORD