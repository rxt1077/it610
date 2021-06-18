FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y docker.io ansible
COPY id_rsa* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa
COPY hosts /etc/ansible/hosts
ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV ANSIBLE_DEPRECATION_WARNINGS=False
