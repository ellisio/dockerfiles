FROM alpine:3.5
MAINTAINER Andrew Ellis <awellis89@gmail.com>

RUN set -x \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data

RUN apk --update add rsync \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

CMD true
