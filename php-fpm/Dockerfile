FROM php:7.2.5-fpm-alpine
MAINTAINER Andrew Ellis <awellis89@gmail.com>

RUN set -ex; \
    apk --update add --virtual php-dependencies \
        curl \
        git \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        hiredis-dev \
        zlib-dev \
        imap-dev \
        icu-dev \
        libxml2-dev \
        postgresql-dev \
        fcgi \
    ; \
    docker-php-ext-install pdo_mysql soap intl imap bcmath zip pgsql opcache; \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install gd; \
    rm -rf /tmp/*; \
    rm -rf /var/cache/apk/*;
    
RUN set -ex; \
    apk --update add --virtual build-dependencies \
        re2c \
        file \
        autoconf \
        gcc \
        make \
        musl-dev \
    ; \
    git clone https://github.com/nrk/phpiredis.git; \
    cd phpiredis; \
    phpize && ./configure --enable-phpiredis; \
    make; \
    make install; \
    cd ../; \
    rm -rf phpiredis; \
    apk del build-dependencies; \
    rm -rf /tmp/*; \
    rm -rf /var/cache/apk/*;

VOLUME /app
WORKDIR /app

EXPOSE 9000
CMD ["php-fpm", "-F"]

HEALTHCHECK --interval=5s --timeout=3s \
    CMD \
    SCRIPT_NAME=/ping \
    SCRIPT_FILENAME=/ping \
    REQUEST_METHOD=GET \
    cgi-fcgi -bind -connect 127.0.0.1:9000 || exit 1
