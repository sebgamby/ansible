FROM ubuntu:focal
USER root
RUN apt update && \
    apt upgrade -y && \
    apt install ansible -y
RUN mkdir -p .ssh
COPY --chown=root:root key.txt /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa