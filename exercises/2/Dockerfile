FROM tgagor/centos
RUN yum -y update
RUN yum -y install httpd procps
COPY httpd.conf /etc/httpd/conf/
RUN useradd www
RUN chown www:www /var/log/httpd
RUN chown www:www /var/run/httpd
CMD httpd -DFOREGROUND