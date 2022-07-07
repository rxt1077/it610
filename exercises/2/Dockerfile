FROM tgagor/centos
RUN yum -y update
RUN yum -y install httpd procps
COPY httpd.conf /etc/httpd/conf/
CMD httpd -DFOREGROUND
