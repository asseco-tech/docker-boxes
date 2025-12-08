FROM docker.io/redhat/ubi8:8.10
ARG HELM_VERSION

# METADATA

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

# INSTALLATION

WORKDIR /tmp
RUN dnf install -y diffutils rsync wget && \
    dnf clean all

RUN wget -q https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
         -O helm-linux-amd64.tar.gz \
    && tar -zxvf helm-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

RUN  wget -q https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
           -O kustomize_linux_amd4.tar.gz \
    && tar -zxvf kustomize_linux_amd4.tar.gz \
    && mv kustomize /usr/local/bin/kustomize \
    && chmod +x /usr/local/bin/kustomize

RUN  wget -q https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64 \
    && mv yq_linux_amd64 /usr/local/bin/yq \
    && chmod a+xr,og-w /usr/local/bin/yq

RUN  wget -q https://github.com/jqlang/jq/releases/download/jq-${JQ_VERSION}/jq-linux-amd64 \
    && mv jq-linux-amd64 /usr/local/bin/jq \
    && chmod a+xr,og-w /usr/local/bin/jq \
    && rm -rf *

WORKDIR /home

CMD ["bash"]