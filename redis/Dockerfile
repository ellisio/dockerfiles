FROM redis:3.2.11-alpine
MAINTAINER Andrew Ellis <awellis89@gmail.com>

HEALTHCHECK --interval=5s --timeout=3s \
    CMD \
    redis-cli ping || exit 1
