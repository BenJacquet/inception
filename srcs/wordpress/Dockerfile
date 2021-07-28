FROM debian:buster

COPY wp-config.php www.conf ./

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

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]