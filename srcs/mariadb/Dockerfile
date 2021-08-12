FROM debian:buster

COPY entrypoint.sh my.cnf ./

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server mariadb-client \
    && mv my.cnf /etc/mysql \
    && mkdir -p /var/run/mysqld \
    && mkdir -p /var/run/mysql \
    && mysql_install_db --ldata=/var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

EXPOSE 3306

CMD ["sh", "entrypoint.sh"]