FROM debian:buster

COPY entrypoint.sh my.cnf database.sql ./

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server mariadb-client procps \
    && mv my.cnf /etc/mysql \
    && mkdir -p /var/run/mysqld \
    && mysql_install_db --ldata=/var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld_safe", "--user=root"]