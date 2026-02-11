FROM docker.io/redhat/ubi8:8.10
ARG OC_VERSION

# METADATA
ARG BASH_VERSION="4.4.x"

# Note: Latest version of helm may be found at
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="3.18.6"

# Note: Latest version of helmfile may be found at
# https://github.com/helmfile/helmfile/releases
ENV HELMFILE_VERSION="1.2.3"

# Note: Latest version of kustomize may be found at
# https://github.com/kubernetes-sigs/kustomize/releases
ENV KUSTOMIZE_VERSION="5.5.0"

# Note: Latest version of oc may be found at
# https://mirror.openshift.com/pub/openshift-v4/clients/ocp/
ENV OC_VERSION=${OC_VERSION}

ARG VENDOR="Asseco Poland S.A."
ARG SOURCE_URL="https://github.com/asseco-tech/docker-boxes"
ARG DESC_P1="This container focused on Kubernetes deployment and Helm operations."
ARG DESC_P2="The following tools are included: oc ${OC_VERSION}, helm ${HELM_VERSION}, helmfile ${HELMFILE_VERSION}, kustomize ${KUSTOMIZE_VERSION}, bash ${BASH_VERSION}, curl ${CURL_VERSION}."
ARG DESC_P3="The image is based on Red Hat UBI 8."

LABEL vendor="${VENDOR}" \
      org.opencontainers.image.vendor="${VENDOR}" \
      org.opencontainers.image.source="${SOURCE_URL}" \
      org.opencontainers.image.description="${DESC_P1} ${DESC_P2} ${DESC_P3}"


# INSTALLATION

WORKDIR /tmp

# linux update && install
RUN dnf update -y \
    ## git
    && dnf install -y git-core \
    && dnf clean all \
    # python3.6 libs has vulnerabilities
    && rm -rf /usr/lib/python3.6 \
    && rm -rf /usr/share/python3-wheels \
    # dnf uses deleted python libs
    && rm -f /usr/bin/dnf

ENV HELM_PLUGINS=/usr/local/bin/plugins
RUN curl -sL https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
          -o helm-linux-amd64.tar.gz \
    && tar -zxvf helm-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && helm plugin install https://github.com/databus23/helm-diff

RUN curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
          -o kustomize_linux_amd4.tar.gz \
    && tar -zxvf kustomize_linux_amd4.tar.gz \
    && mv kustomize /usr/local/bin/kustomize \
    && chmod +x /usr/local/bin/kustomize

RUN curl -sL -O https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-linux-amd64-rhel8.tar.gz \
    && tar -zxvf openshift-client-linux-amd64-rhel8.tar.gz \
    && mv oc /usr/local/bin/oc \
    && chmod +x /usr/local/bin/oc

RUN curl -sL https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_amd64.tar.gz \
          -o helmfile_linux_amd64.tar.gz \
    && tar -zxvf helmfile_linux_amd64.tar.gz \
    && mv helmfile /usr/local/bin/helmfile \
    && chmod +x /usr/local/bin/helmfile

WORKDIR /home

CMD ["bash"]