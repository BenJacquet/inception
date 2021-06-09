FROM debian:buster

COPY initialize_db.sql my.cnf ./

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server mariadb-client vim \
    && groupadd -r mysql && useradd -r -g mysql mysql \
    && mv my.cnf /etc/ \
    && mkdir -p run/mysqld \
    && mysql_install_db --ldata=/var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld;

EXPOSE 3306

CMD ["mysqld_safe", "--user=root", "--init_file=/initialize_db.sql"]
#ENTRYPOINT 
#mysqld_safe --user=root --init_file=/initialize_db.sql