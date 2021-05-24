FROM debian:buster

COPY initialize_db.sql my.cnf ./

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server mariadb-client vim \
    && mv my.cnf /etc/ \
    && mysql_install_db --user=root --ldata=/var/lib/mysql

EXPOSE 3306

ENTRYPOINT mysqld_safe