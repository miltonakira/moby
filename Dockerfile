FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    nginx \
    git \
    unzip 

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["bash", "-c", "php-fpm & nginx -g 'daemon off;'"]
