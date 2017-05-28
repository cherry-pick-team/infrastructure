FROM php:7-fpm-alpine

RUN set -ex \
  && apk --no-cache add postgresql-dev

RUN docker-php-ext-install pdo pdo_pgsql

RUN apk --update add wget curl git && rm /var/cache/apk/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

ADD https://raw.githubusercontent.com/cherry-pick-team/auth-service/master/composer.json composer.json
ADD https://raw.githubusercontent.com/cherry-pick-team/auth-service/master/composer.lock composer.lock
RUN composer install --prefer-dist --no-scripts

ADD https://api.github.com/repos/cherry-pick-team/auth-service/contents/composer.lock version.json
RUN git clone -b master https://github.com/cherry-pick-team/auth-service.git

WORKDIR auth-service

RUN composer install --prefer-dist
RUN chmod -R 777 storage bootstrap/cache
RUN cp .env.example .env

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["php-fpm", "-e"]
