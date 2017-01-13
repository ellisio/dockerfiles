FROM nginx:1.11.8-alpine
MAINTAINER Andrew Ellis <awellis89@gmail.com>

RUN set -x \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data

ADD entrypoint.sh /entrypoint.sh
ADD readiness.sh /readiness.sh
ADD liveness.sh /liveness.sh

VOLUME /app
WORKDIR /app

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx"]

ADD conf/nginx.conf /etc/nginx/
ADD conf/mime.types /etc/nginx/
ADD conf/fastcgi_params /etc/nginx/
ADD conf/default.conf /etc/nginx/conf.d/
