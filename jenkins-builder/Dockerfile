FROM jenkins/jnlp-slave:3.19-1

##
# Set USER to root so we can install toys.
##
USER root

##
# Install Dependencies
##
RUN set -ex; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    curl \
  ; \
  rm -rf /var/lib/apt/lists/*

##
# Set USER back to jenkins.
##
USER jenkins

##
# Install gcloud
##
RUN set ex; \
  curl -sSo gcloud-installer https://sdk.cloud.google.com; \
  chmod +x ./gcloud-installer; \
  ./gcloud-installer --disable-prompts; \
  rm -rf ./gcloud-installer

ENV PATH $PATH:$HOME/google-cloud-sdk/bin
