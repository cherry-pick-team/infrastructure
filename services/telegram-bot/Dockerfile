FROM php:7-fpm-alpine

RUN set -ex \
  && apk --no-cache add postgresql-dev

RUN apk --update add wget curl git && rm /var/cache/apk/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

ADD https://raw.githubusercontent.com/cherry-pick-team/telegram-bot/master/composer.json composer.json
ADD https://raw.githubusercontent.com/cherry-pick-team/telegram-bot/master/composer.lock composer.lock
RUN composer install --prefer-dist --no-scripts --no-autoloader && \
    rm -rf vendor

ADD https://api.github.com/repos/cherry-pick-team/telegram-bot/git/refs/heads/master version.json
RUN git clone -b master https://github.com/cherry-pick-team/telegram-bot.git

WORKDIR telegram-bot

RUN composer install --prefer-dist && \
    rm -rf ~/.composer

CMD ["php-fpm", "-e"]
