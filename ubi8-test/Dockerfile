FROM docker.io/redhat/ubi8:8.10

# INSTALLATION
RUN dnf update && \
    dnf clean all

# python3.6 libs has Vulnerabilities
RUN rm -rf /usr/lib/python3.6 \
    && rm -rf /usr/share/python3-wheels

WORKDIR /home

CMD ["bash"]