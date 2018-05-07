FROM jenkins/jnlp-slave:3.19-1

ENV CLOUD_SDK_VERSION=200.0.0
ENV CLOUDSDK_CORE_DISABLE_PROMPTS=1
ENV PATH=/opt/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

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
    jq \
    libapparmor-dev \
    libseccomp-dev \
  ; \
  rm -rf /var/lib/apt/lists/*

##
# Install Gcloud
##
RUN set -ex; \
  curl -sS https://sdk.cloud.google.com | bash; \
  mv google-cloud-sdk /opt; \
  gcloud components update --version=${CLOUD_SDK_VERSION}; \
  gcloud --version

##
# Install Kubectl
##
RUN set -ex; \
  gcloud components install kubectl; \
  kubectl version --client

##
# Install Helm
##
RUN set -ex; \
  curl -sS https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash; \
  helm version --client
