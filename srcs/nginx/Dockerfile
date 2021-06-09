FROM debian:buster

COPY jabenjam.42.fr.conf nginx.conf ssl_request.conf ./

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y nginx openssl vim procps\
    && mkdir -p /etc/nginx/ssl \
    && chmod 700 /etc/nginx/ssl \
    && openssl req -x509 -config ssl_request.conf -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    && mkdir -p var/www/html \
    && rm /etc/nginx/nginx.conf \
    && mv nginx.conf etc/nginx \
    && mv jabenjam.42.fr.conf etc/nginx/conf.d

EXPOSE 443

CMD ["nginx"]