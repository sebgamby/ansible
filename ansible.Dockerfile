FROM ubuntu:focal
USER root
RUN apt update && \
    apt upgrade -y && \
    apt install ansible -y