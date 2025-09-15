FROM docker.io/rockylinux:9
RUN yum -y update
RUN yum -y install httpd procps
COPY httpd.conf /etc/httpd/conf/
CMD httpd -DFOREGROUND
