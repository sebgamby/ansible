FROM atlassian/bamboo-agent-base:latest
USER root
RUN apt-get update && \
    apt-get install ca-certificates curl gnupg lsb-release sudo -y && \
    mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg 
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && \
    apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
RUN systemctl enable docker
RUN usermod -a -G docker bamboo
RUN usermod -a -G sudo bamboo
RUN echo "bamboo:Welcome12#" | chpasswd
USER bamboo
RUN /bamboo-update-capability.sh "Docker" /usr/bin/docker