FROM debian:buster

COPY wp-config.php ./

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y wget php php-cli php-fpm php-cgi php-mysql php-mbstring openssl \
    && wget -O /usr/share/latest.tar.gz http://wordpress.org/latest.tar.gz \
    && tar -xzvf /usr/share/latest.tar.gz -C /usr/share \
    && rm -rf /usr/share/latest.tar.gz \
    && rm -rf /usr/share/wordpress/wp-config.php \
    && mv wp-config.php /usr/share/wordpress \
    && php --server 172.17.0.2:9000 --docroot /usr/share/wordpress

EXPOSE 9000

ENTRYPOINT bash