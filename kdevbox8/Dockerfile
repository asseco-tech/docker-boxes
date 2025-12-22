FROM docker.io/redhat/ubi8:8.10
ARG HELM_VERSION

# METADATA
ARG BASH_VERSION="4.4.x"

# Note: Latest version of helm may be found at
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION=$HELM_VERSION

# Note: Latest version of kustomize may be found at
# https://github.com/kubernetes-sigs/kustomize/releases
ENV KUSTOMIZE_VERSION="5.5.0"

# Note: Latest version of yq may be found at
# https://github.com/mikefarah/yq/releases
ENV YQ_VERSION="4.47.2"

# Note: Latest version of yq may be found at
# https://github.com/mikefarah/yq/releases
ENV JQ_VERSION="1.8.1"

ARG VENDOR="Asseco Poland S.A."
ARG SOURCE_URL="https://github.com/asseco-tech/docker-boxes"
ARG DESC_P1="A comprehensive development container with essential Kubernetes and DevOps tools."
ARG DESC_P2="The following tools are included: helm ${HELM_VERSION}, kustomize ${KUSTOMIZE_VERSION}, yq ${YQ_VERSION}, jq ${JQ_VERSION}, bash ${BASH_VERSION}, curl, envsubst, cmp, diff."
ARG DESC_P3="The image is based on Red Hat UBI 8."

LABEL vendor="${VENDOR}" \
      org.opencontainers.image.vendor="${VENDOR}" \
      org.opencontainers.image.source="${SOURCE_URL}" \
      org.opencontainers.image.description="${DESC_P1} ${DESC_P2} ${DESC_P3}"


# INSTALLATION

WORKDIR /tmp

# linux update && install
#   diffutils: cmp, diff
#   gettext: envsubst, msgcat
#   rsync: rsync
RUN dnf update -y \
    && dnf install -y diffutils gettext rsync \
    && dnf clean all \
    # python3.6 libs has vulnerabilities
    && rm -rf /usr/lib/python3.6 \
    && rm -rf /usr/share/python3-wheels \
    # dnf uses deleted python libs
    && rm -f /usr/bin/dnf

RUN curl -sL https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
         -o helm-linux-amd64.tar.gz \
    && tar -zxvf helm-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

RUN  curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
           -o kustomize_linux_amd4.tar.gz \
    && tar -zxvf kustomize_linux_amd4.tar.gz \
    && mv kustomize /usr/local/bin/kustomize \
    && chmod +x /usr/local/bin/kustomize

RUN  curl -sL -O https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64 \
    && mv yq_linux_amd64 /usr/local/bin/yq \
    && chmod a+xr,og-w /usr/local/bin/yq

RUN  curl -sL -O https://github.com/jqlang/jq/releases/download/jq-${JQ_VERSION}/jq-linux-amd64 \
    && mv jq-linux-amd64 /usr/local/bin/jq \
    && chmod a+xr,og-w /usr/local/bin/jq \
    && rm -rf *

WORKDIR /home

CMD ["bash"]