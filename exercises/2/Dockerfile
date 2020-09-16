FROM centos
RUN yum -y update
RUN yum -y install httpd
COPY httpd.conf /etc/httpd/conf/
CMD httpd -DFOREGROUND
