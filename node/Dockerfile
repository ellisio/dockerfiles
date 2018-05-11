FROM debian:stretch

ENV NODEJS_VERSION 8.11.1

RUN set -ex; \
  apt-get update; \
  apt-get install -y \
    curl \
    build-essential \
    libpng-dev \
  ; \
  rm -rf /var/lib/apt/lists/*

RUN set -ex; \
  curl -sSo node-v${NODEJS_VERSION}-linux-x64.tar.gz https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz; \
  tar -xf node-v${NODEJS_VERSION}-linux-x64.tar.gz --directory /usr/local --strip-components 1; \
  rm -rf node-v${NODEJS_VERSION}-linux-x64.tar.gz; \
  npm i -g yarn; \
  npm cache clear --force; \
  node --version; \
  npm --version
