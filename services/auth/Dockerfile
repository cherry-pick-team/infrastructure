FROM php:7-fpm-alpine

RUN apk --update add wget curl git && rm /var/cache/apk/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

ADD https://api.github.com/repos/cherry-pick-team/auth-service/git/refs/heads/master version.json
RUN git clone -b master https://github.com/cherry-pick-team/auth-service.git

WORKDIR auth-service

RUN composer install --prefer-dist
RUN chmod -R 777 storage

CMD ["php-fpm", "-e"]
