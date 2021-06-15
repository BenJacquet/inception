FROM debian:buster

COPY initialize_db.sql my.cnf ./

#ENV WORDPRESS_DB_USER=$WORDPRESS_DB_USER
#ENV WORDPRESS_DB_PASSWORD=$WORDPRESS_DB_PASSWORD
#ENV WORDPRESS_DB_HOST=$WORDPRESS_DB_HOST
#ENV WORDPRESS_DB_NAME=$WORDPRESS_DB_NAME

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server mariadb-client \
   # && groupadd -r mysql && useradd -r -g mysql mysql \
    && mv my.cnf /etc/ \
    && mkdir -p run/mysqld \
    && mysql_install_db --ldata=/var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld;

EXPOSE 3306

CMD ["mysqld_safe", "--user=wordpress", "--init_file=/initialize_db.sql"]