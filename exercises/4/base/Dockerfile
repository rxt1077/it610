FROM jrei/systemd-ubuntu:20.04
RUN apt-get update
RUN apt-get install -y python ssh gpg
COPY authorized_keys /root/.ssh/authorized_keys
EXPOSE 22
