FROM docker.io/redhat/ubi9:9.8
ARG PYTHON_VERSION

# METADATA
ARG BASH_VERSION="5.1.x"

# Note: Python 3.14 is installed from the UBI 9 AppStream repository (python3.14 RPM);
# available versions: dnf list --showduplicates python3.14
ENV PYTHON_VERSION=${PYTHON_VERSION}

# Note: Versions and SHA256 of pip and uv are pinned in requirements.txt
# https://pypi.org/project/pip/
# https://pypi.org/project/uv/
ENV PIP_VERSION="26.2.1" \
    UV_VERSION="0.13.1"

# uv uses the Python 3.14 of the image instead of downloading its own
ENV UV_PYTHON_PREFERENCE=only-system

ARG VENDOR="Asseco Poland S.A."
ARG SOURCE_URL="https://github.com/asseco-tech/docker-boxes"
ARG DESC_P1="The Python build container for applications and PyInstaller binaries running on Red Hat UBI 9 (glibc 2.34)."
ARG DESC_P2="The following tools are included: python ${PYTHON_VERSION}, pip ${PIP_VERSION}, uv ${UV_VERSION}, gcc, binutils, bash ${BASH_VERSION}, curl, tar, gzip."
ARG DESC_P3="The image is based on Red Hat UBI 9."

LABEL vendor="${VENDOR}" \
      org.opencontainers.image.vendor="${VENDOR}" \
      org.opencontainers.image.source="${SOURCE_URL}" \
      org.opencontainers.image.description="${DESC_P1} ${DESC_P2} ${DESC_P3}"


# INSTALLATION

WORKDIR /tmp

# linux update && install
#   python3.14-devel: headers for building C extensions
#   python3.14-pip: bootstrap pip, upgraded below to the pinned version
#   gcc: C compiler for C extensions
#   binutils: objdump, required by PyInstaller
RUN dnf update -y \
    && dnf install -y python3.14-${PYTHON_VERSION} python3.14-devel-${PYTHON_VERSION} python3.14-pip \
                      gcc binutils tar gzip \
    && dnf clean all \
    # python3.9 libs has vulnerabilities
    && rm -rf /usr/lib/python3.9 \
    && rm -rf /usr/share/python3-wheels \
    # dnf uses deleted python libs
    && rm -f /usr/bin/dnf

# python and python3 commands point to Python 3.14
RUN ln -s /usr/bin/python3.14 /usr/local/bin/python \
    && ln -s /usr/bin/python3.14 /usr/local/bin/python3

# pip and uv from PyPI, verified with SHA256 from requirements.txt
COPY requirements.txt /tmp/requirements.txt
RUN python3.14 -m pip install --no-cache-dir --require-hashes -r /tmp/requirements.txt \
    && python3.14 -m pip --version | grep -q "^pip ${PIP_VERSION} " \
    && uv --version | grep -q "^uv ${UV_VERSION}" \
    && rm -rf /tmp/*

WORKDIR /home

CMD ["bash"]
