FROM debian:buster

COPY initialize_db.sql my.cnf ./

ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ENV MYSQL_DATABASE=$MYSQL_DATABASE

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server mariadb-client \
    && mv my.cnf /etc/mysql \
    && mkdir -p run/mysqld \
    && mysql_install_db --ldata=/var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld
#    && mysql_install_db

EXPOSE 3306

CMD ["mysqld_safe", "--user=root", "--init_file=/initialize_db.sql"]