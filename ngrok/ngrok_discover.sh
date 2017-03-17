#!/bin/sh

if [ "$1" = "/bin/sh" ]; then
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

sed -i "s/^authtoken:.*/authtoken: $NGROK_TOKEN/g" /ngrok.yml
ARGS="-config /ngrok.yml"

IFS=','; for TUNNEL in `echo "$NGROK_TUNNELS"`; do
  cp /ngrok-tunnel.yml /ngrok-$TUNNEL.yml

  SUBDOMAIN=$NGROK_SUBDOMAIN

  if [[ $TUNNEL != 'app' ]]; then
    SUBDOMAIN="$SUBDOMAIN-$TUNNEL"
  fi

  sed -i "s/##SUBDOMAIN##/$SUBDOMAIN" /ngrok-$app.yml

  ARGS="$ARGS -config=/ngrok-$app.yml"
done

exec /bin/ngrok $ARGS
