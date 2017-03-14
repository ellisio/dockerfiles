FROM ellisio/php:7.1.2
MAINTAINER Andrew Ellis <awellis89@gmail.com>

ADD entrypoint.sh /entrypoint.sh
ADD readiness.sh /readiness.sh
ADD liveness.sh /liveness.sh

VOLUME /app
WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php", "artisan", "queue:work"]
