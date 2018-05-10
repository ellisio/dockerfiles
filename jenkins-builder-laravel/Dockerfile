FROM ellisio/jenkins-builder:3.19-1

##
# Force Root
##
USER root

##
# Install PHP
##
RUN set -ex; \
  apt-get update; \
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
  ; \
  rm -rf /var/lib/apt/lists/*;

RUN set -ex; \
  curl -sS -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
  echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list; \
  apt-get update; \
  apt-get install -y \
    libpng-dev \
    php7.2 \
    php7.2-curl \
    php7.2-mysql \
    php7.2-soap \
    php7.2-intl \
    php7.2-imap \
    php7.2-bcmath \
    php7.2-zip \
    php7.2-pgsql \
    php7.2-opcache \
    php7.2-gd \
    php7.2-mbstring \
    php7.2-dom \
  ; \
  rm -rf /var/lib/apt/lists/*

##
# Install Composer
##
RUN set -ex; \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; \
  composer global require hirak/prestissimo; \
  composer global clearcache; \
  composer global info; \
  composer --version

##
# Install NodeJS
##
ENV NODEJS_VERSION 8.11.1

RUN set -ex; \
  curl -sSo node-v${NODEJS_VERSION}-linux-x64.tar.gz https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz; \
  tar -xf node-v${NODEJS_VERSION}-linux-x64.tar.gz --directory /usr/local --strip-components 1; \
  rm -rf node-v${NODEJS_VERSION}-linux-x64.tar.gz; \
  npm i -g yarn; \
  npm cache clear --force; \
  node --version; \
  npm --version
