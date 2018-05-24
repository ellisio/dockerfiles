FROM alpine:3.7

ENV CLOUD_SDK_VERSION 202.0.0
ENV KUBECTL_VERSION v1.10.2
ENV HELM_VERSION v2.9.1
ENV PATH /google-cloud-sdk/bin:$PATH

RUN set -ex; \
  apk --no-cache add \
    curl \
    python \
    py-crcmod \
    bash \
    libc6-compat \
    openssh-client \
    git \
    ca-certificates \
  ; \
  curl -LO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz; \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz; \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz; \
    ln -s /lib /lib64; \
    gcloud config set core/disable_usage_reporting true; \
    gcloud config set component_manager/disable_update_check true; \
    gcloud config set metrics/environment github_docker_image; \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl; \
    chmod +x ./kubectl; \
    mv ./kubectl /usr/local/bin/kubectl; \
  curl -LO https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz; \
    tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz; \
    mv linux-amd64/helm /usr/local/bin; \
    rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz; \
    helm init --client-only; \
    helm repo remove local; \
    helm repo add sm https://salesmessage-charts.storage.googleapis.com; \
  gcloud --version; \
  kubectl version --client; \
  helm version --client

VOLUME ["/root/.config"]
