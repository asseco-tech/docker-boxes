FROM docker.io/redhat/ubi9:9.8
ARG OC_VERSION

# METADATA
ARG BASH_VERSION="5.1.x"

# Note: Latest version of helm may be found at
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="3.18.6"
# SHA256 of helm-v${HELM_VERSION}-linux-amd64.tar.gz, see .sha256sum file at https://get.helm.sh
ARG HELM_SHA256="3f43c0aa57243852dd542493a0f54f1396c0bc8ec7296bbb2c01e802010819ce"

# Note: Latest version of helmfile may be found at
# https://github.com/helmfile/helmfile/releases
ENV HELMFILE_VERSION="1.8.1"
# SHA256 of helmfile_${HELMFILE_VERSION}_linux_amd64.tar.gz, see helmfile_${HELMFILE_VERSION}_checksums.txt file of the release
ARG HELMFILE_SHA256="ccabbe75dddbc25008d055fe92a44f95a184342211e7244d32b870409239c7a3"

# Note: Latest version of helm-diff plugin may be found at
# https://github.com/databus23/helm-diff/releases
ENV HELM_DIFF_VERSION="3.15.15"
# SHA256 of helm-diff-linux-amd64.tgz, see helm-diff_${HELM_DIFF_VERSION}_checksums.txt file of the release
ARG HELM_DIFF_SHA256="504e99410611daa70702362e1b10dc74929df8a912cb3f6b5d21d1ee9d0cb7d9"

# Note: Latest version of kustomize may be found at
# https://github.com/kubernetes-sigs/kustomize/releases
ENV KUSTOMIZE_VERSION="5.5.0"
# SHA256 of kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz, see checksums.txt file of the release
ARG KUSTOMIZE_SHA256="6703a3a70a0c47cf0b37694030b54f1175a9dfeb17b3818b623ed58b9dbc2a77"

# Note: Latest version of oc may be found at
# https://mirror.openshift.com/pub/openshift-v4/clients/ocp/
ENV OC_VERSION=${OC_VERSION}

ARG VENDOR="Asseco Poland S.A."
ARG SOURCE_URL="https://github.com/asseco-tech/docker-boxes"
ARG DESC_P1="This container focused on Kubernetes deployment and Helm operations."
ARG DESC_P2="The following tools are included: oc ${OC_VERSION}, helm ${HELM_VERSION}, helmfile ${HELMFILE_VERSION}, kustomize ${KUSTOMIZE_VERSION}, bash ${BASH_VERSION}, curl ${CURL_VERSION}."
ARG DESC_P3="The image is based on Red Hat UBI 9."

LABEL vendor="${VENDOR}" \
      org.opencontainers.image.vendor="${VENDOR}" \
      org.opencontainers.image.source="${SOURCE_URL}" \
      org.opencontainers.image.description="${DESC_P1} ${DESC_P2} ${DESC_P3}"


# INSTALLATION

WORKDIR /tmp

# linux update && install
RUN dnf update -y \
    ## git \
    && dnf install -y git-core \
    && dnf clean all \
    # python3.9 libs has vulnerabilities \
    && rm -rf /usr/lib/python3.9 \
    && rm -rf /usr/share/python3-wheels \
    # dnf uses deleted python libs \
    && rm -f /usr/bin/dnf

ENV HELM_PLUGINS=/usr/local/bin/plugins
RUN curl -sfL https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
          -o helm-linux-amd64.tar.gz \
    && echo "${HELM_SHA256}  helm-linux-amd64.tar.gz" | sha256sum -c - \
    && tar -zxvf helm-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

# helm-diff is unpacked directly into HELM_PLUGINS,
# so the plugin install hook does not download the binary again
RUN curl -sfL https://github.com/databus23/helm-diff/releases/download/v${HELM_DIFF_VERSION}/helm-diff-linux-amd64.tgz \
          -o helm-diff-linux-amd64.tgz \
    && echo "${HELM_DIFF_SHA256}  helm-diff-linux-amd64.tgz" | sha256sum -c - \
    && mkdir -p ${HELM_PLUGINS} \
    && tar -zxvf helm-diff-linux-amd64.tgz -C ${HELM_PLUGINS} \
    && helm plugin list | grep -q "^diff[[:space:]]*${HELM_DIFF_VERSION}"

RUN curl -sfL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
          -o kustomize_linux_amd4.tar.gz \
    && echo "${KUSTOMIZE_SHA256}  kustomize_linux_amd4.tar.gz" | sha256sum -c - \
    && tar -zxvf kustomize_linux_amd4.tar.gz \
    && mv kustomize /usr/local/bin/kustomize \
    && chmod +x /usr/local/bin/kustomize

RUN curl -sL -O https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-linux-amd64-rhel9.tar.gz \
    && tar -zxvf openshift-client-linux-amd64-rhel9.tar.gz \
    && mv oc /usr/local/bin/ \
    && mv kubectl /usr/local/bin/ \
    && chmod +x /usr/local/bin/oc /usr/local/bin/kubectl

# helmfile needs: helm, helm-diff, kustomize
RUN curl -sfL https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_amd64.tar.gz \
          -o helmfile_linux_amd64.tar.gz \
    && echo "${HELMFILE_SHA256}  helmfile_linux_amd64.tar.gz" | sha256sum -c - \
    && tar -zxvf helmfile_linux_amd64.tar.gz \
    && mv helmfile /usr/local/bin/helmfile \
    && chmod +x /usr/local/bin/helmfile

WORKDIR /home

CMD ["bash"]