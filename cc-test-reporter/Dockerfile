FROM alpine:3.7

ENV CC_TEST_REPORTER_VERSION="0.1.4"

RUN set -ex; \
  apk add --no-cache \
    curl \
  ; \
  curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/local/bin/cc-test-reporter; \
  chmod +x /usr/local/bin/cc-test-reporter

COPY docker-entrypoint /usr/local/bin/

ENTRYPOINT ["docker-entrypoint"]

CMD ["cc-test-reporter"]
