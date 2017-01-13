FROM alpine:3.5
MAINTAINER Andrew Ellis <awellis89@gmail.com>

ENV VERSION="1.10"

RUN mkdir /var/lib/beanstalkd

RUN apk --update add --virtual build-dependencies \
        gcc \
        make \
        musl-dev \
        curl

RUN curl -sL https://github.com/kr/beanstalkd/archive/v$VERSION.tar.gz | tar xvz -C /tmp \
    && cd /tmp/beanstalkd-$VERSION \
    && sed -i "s|#include <sys/fcntl.h>|#include <fcntl.h>|g" sd-daemon.c \
    && make \
    && cp beanstalkd /usr/bin

RUN apk del build-dependencies \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

EXPOSE 11300
CMD ["beanstalkd", "-p", "11300", "-b", "/var/lib/beanstalkd"]
