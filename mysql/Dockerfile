FROM mysql:5.7.22
MAINTAINER Andrew Ellis <awellis89@gmail.com>

HEALTHCHECK --interval=5s --timeout=3s \
    CMD \
    mysqladmin ping || exit 1
