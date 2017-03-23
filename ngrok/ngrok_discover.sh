#!/bin/bash

if [ "$1" = "/bin/bash" ]; then
  shift
fi

if [ -z "$NGROK_SUBDOMAIN" ]; then
  echo "Missing the NGROK_SUBDOMAIN environment variable."
  exit 1
fi

if [ -z "$NGROK_TUNNELS" ]; then
  echo "Missing the NGROK_TUNNELS environment variable."
  exit
fi

if [ -z "$NGROK_TOKEN" ]; then
  echo "Missing the NGROK_TOKEN environment variable."
  exit
fi

ARGS=""
IFS=','; for TUNNEL in `echo "$NGROK_TUNNELS"`; do
  cp /ngrok-tunnel.yml /ngrok-$TUNNEL.yml

  SUBDOMAIN=$NGROK_SUBDOMAIN

  if [[ "$TUNNEL" != "app" ]]; then
    SUBDOMAIN="$SUBDOMAIN-$TUNNEL"
  fi

  sed -i "s/##ADDR##/$TUNNEL-nginx/g" /ngrok-$TUNNEL.yml
  sed -i "s/##SUBDOMAIN##/$SUBDOMAIN/g" /ngrok-$TUNNEL.yml

  if [ ! -z "$HTTPS_ONLY" ]; then
    sed -i "s/##HTTPS_ONLY##/bind_tls: true/g" /ngrok-$TUNNEL.yml
  fi

  ARGS="$ARGS -config /ngrok-$TUNNEL.yml"
done

unset IFS

sed -i "s/^authtoken:.*/authtoken: $NGROK_TOKEN/g" /ngrok.yml
ARGS="$ARGS -config /ngrok.yml"

exec /bin/ngrok start $ARGS --all
