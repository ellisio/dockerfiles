FROM ellisio/php:7.2.5
MAINTAINER Andrew Ellis <awellis89@gmail.com>

ADD crontab /var/spool/cron/crontabs/root

VOLUME /app
WORKDIR /app

CMD ["crond", "-f"]
