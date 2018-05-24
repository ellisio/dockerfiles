FROM ellisio/php:7.2.5

RUN set -ex; \
  apk add --no-cache $PHPIZE_DEPS; \
  pecl install xdebug; \
  docker-php-ext-enable xdebug; \
  php --version
