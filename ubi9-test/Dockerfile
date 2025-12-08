FROM docker.io/redhat/ubi9:9.7

# INSTALLATION
RUN dnf update -y && \
    dnf clean all

# python3.9 libs has Vulnerabilities
RUN rm -rf /usr/lib/python3.9 \
    && rm -rf /usr/share/python3-wheels

WORKDIR /home

CMD ["bash"]