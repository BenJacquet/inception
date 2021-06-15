FROM debian:buster

COPY wp-config.php www.conf ./

ENV WORDPRESS_DB_USER=$WORDPRESS_DB_USER
ENV WORDPRESS_DB_PASSWORD=$WORDPRESS_DB_PASSWORD
ENV WORDPRESS_DB_HOST=$WORDPRESS_DB_HOST
ENV WORDPRESS_DB_NAME=$WORDPRESS_DB_NAME

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget php php-cli php-fpm php-cgi php-mysql php-mbstring \
    && mkdir -p /var/www \
    && wget -O /var/www/latest.tar.gz http://wordpress.org/latest.tar.gz \
    && tar -xzvf /var/www/latest.tar.gz -C /var/www \
    && rm -rf /var/www/latest.tar.gz \
    && mv /var/www/wordpress /var/www/html \ 
    && rm -rf /var/www/html/wp-config.php \
    && rm -rf /etc/php/7.3/fpm/pool.d/www.conf \
    && mv wp-config.php /var/www/html \
    && mv www.conf /etc/php/7.3/fpm/pool.d \
    && chown -R www-data:www-data /var/www/html \
    && chmod 755 -R /var/www/html/ \
    && mkdir -p /run/php/
    #&& sed -i "/listen\ =\ \/run\/php\/php7.3-fpm.sock/c\listen\ =\ 0.0.0.0\:9000" /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]