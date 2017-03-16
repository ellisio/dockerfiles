FROM nginx:1.11.10-alpine
MAINTAINER Andrew Ellis <awellis89@gmail.com>

RUN set -x \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data \
    && apk add --no-cache curl

ADD entrypoint.sh /entrypoint.sh
ADD conf/nginx.conf /etc/nginx/
ADD conf/mime.types /etc/nginx/
ADD conf/fastcgi_params /etc/nginx/
ADD conf/default.conf /etc/nginx/conf.d/

VOLUME /app
WORKDIR /app

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx"]

HEALTHCHECK --interval=5s --timeout=1s \
    CMD \
    curl --fail http://localhost:80/ping || exit 1
