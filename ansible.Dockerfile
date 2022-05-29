FROM ubuntu:focal
ENV ANSIBLE_HOST_KEY_CHECKING=False
USER root
RUN apt update && \
    apt upgrade -y && \
    apt install ansible -y
RUN mkdir -p /root/.ssh
ADD --chown=root:root ./id_rsa /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa