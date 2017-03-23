FROM ellisio/php:7.1.3
MAINTAINER Andrew Ellis <awellis89@gmail.com>

ADD entrypoint.sh /entrypoint.sh

VOLUME /app
WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php", "artisan", "queue:work"]
