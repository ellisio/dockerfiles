FROM ellisio/php:7.0.15
MAINTAINER Andrew Ellis <awellis89@gmail.com>

ADD crontab /var/spool/cron/crontabs/root
ADD entrypoint.sh /entrypoint.sh
ADD readiness.sh /readiness.sh
ADD liveness.sh /liveness.sh

VOLUME /app
WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
CMD ["crond", "-f"]
