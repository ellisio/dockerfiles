#!/bin/sh
set -e

if [ ! -z "$CONFIGURE_KUBERNETES" ]; then
  while true; do
    if [ -f "/app/.initialized" ]; then
      chown -R www-data:www-data /app
      touch /app/.kubernetes-configured
      break;
    fi

    sleep 1;
  done
fi

if [ ! -z "$ENABLE_XDEBUG" ]; then
  sed -i 's/; //g' /usr/local/etc/php/conf.d/xdebug.ini
fi

exec "$@"
