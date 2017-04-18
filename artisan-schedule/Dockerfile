FROM ellisio/php:7.1.4
MAINTAINER Andrew Ellis <awellis89@gmail.com>

ADD crontab /var/spool/cron/crontabs/root
ADD entrypoint.sh /entrypoint.sh

VOLUME /app
WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
CMD ["crond", "-f"]
