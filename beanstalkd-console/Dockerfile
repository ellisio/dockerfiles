FROM php:7.1.3-alpine
MAINTAINER Andrew Ellis <awellis89@gmail.com>

ENV VERSION="1.7.6"

RUN apk --update add --virtual build-dependencies \
        curl \
    && curl -sL https://github.com/ptrofimov/beanstalk_console/archive/$VERSION.tar.gz | tar xvz -C /tmp \
    && mv /tmp/beanstalk_console-$VERSION /app \
    && apk del build-dependencies \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

ADD php.ini /usr/local/etc/php/php.ini
ADD entrypoint.sh /entrypoint.sh

EXPOSE 2080
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php", "-S", "0.0.0.0:2080", "-t", "/app/public"]
