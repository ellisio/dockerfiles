FROM debian:jessie-slim
MAINTAINER Andrew Ellis <awellis89@gmail.com>

ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /tmp/ngrok.zip
RUN apt-get update && apt-get install unzip && \
    unzip /tmp/ngrok.zip -d /bin && rm -f /tmp/ngrok.zip && \
    apt-get -y remove unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ngrok.yml /ngrok.yml
ADD ngrok-tunnel.yml /ngrok-tunnel.yml
ADD ngrok_discover.sh /bin/ngrok_discover

EXPOSE 4040
ENTRYPOINT ["/bin/ngrok_discover"]
