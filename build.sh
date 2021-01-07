#!/usr/bin/env sh

declare -a IMAGES=(
  "baseimage:3.7"
  "php:7.2.5"
  "php-fpm:7.2.5"
  "php-xdebug:7.2.5"
  "artisan-queue:7.2.5"
  "artisan-schedule:7.2.5"
  "beanstalkd:1.10"
  "beanstalkd-console:1.7.6"
  "composer:1.6.5"
  "jenkins-builder:3.19-1"
  "jenkins-builder-laravel:1.0"
  "mysql:5.7.22"
  "nextjs:10.0.5"
  "nginx:1.13.12"
  "ngrok:2.1.18"
  "redis:3.2.11"
  "node:8.11.1-1"
  "gcloud:202.0.0-2"
  "cc-test-reporter:0.1.4"
)

for IMAGE in "${IMAGES[@]}"
do
  IFS=':' read -r -a IMAGE <<< "${IMAGE}"

  NAME=${IMAGE[0]}
  VERSION=${IMAGE[1]}

  if [[ ! -z "${1+x}" && "$1" != "$NAME" ]]; then
    continue
  fi

  echo "==> Building ${NAME}:${VERSION}"

  if [ "${NAME}" == "nextjs" ]; then
    docker build -t ellisio/$NAME ./$NAME/ --build-arg X_TAG="$VERSION"
  else
    docker build -t ellisio/$NAME ./$NAME/
  fi
  docker tag ellisio/$NAME:latest ellisio/$NAME:$VERSION

  if [[ ! -z "$2" && "$2" == "true" ]]; then
    docker push ellisio/$NAME:latest
    docker push ellisio/$NAME:$VERSION
  fi
done
