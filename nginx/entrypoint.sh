#!/bin/sh
set -e

# Fix for Kubernetes so it can see the PHP-FPM service.
if [[ -n "$PHP_FPM_HOST" ]]; then
  if [[ -z "$PHP_FPM_PORT" ]]; then
    PHP_FPM_PORT=9000
  fi
  sed -ir "s/ php-fpm:9000/ $PHP_FPM_HOST:$PHP_FPM_PORT/g" /etc/nginx/conf.d/default.conf
elif [[ -n "$PHP_FPM_PORT_9000_TCP_ADDR" ]]; then
  PHP_FPM_HOST=$PHP_FPM_PORT_9000_TCP_ADDR

  if [[ -z "$PHP_FPM_PORT" ]]; then
    if [[ -n "$PHP_FPM_PORT_9000_TCP_PORT" ]]; then
      PHP_FPM_PORT=$PHP_FPM_PORT_9000_TCP_PORT
    fi
  else
    PHP_FPM_PORT=9000
  fi

  sed -ir "s/php-fpm:9000/$PHP_FPM_HOST:$PHP_FPM_PORT/g" /etc/nginx/conf.d/default.conf
fi

if [ ! -z "$DISABLE_SENDFILE" ]; then
  sed -ir "s/sendfile.*/sendfile off;/g" /etc/nginx/conf.d/nginx.conf
  sed -ir "s/tcp_nopush.*/tcp_nopush off;/g" /etc/nginx/conf.d/nginx.conf
fi

exec "$@"
