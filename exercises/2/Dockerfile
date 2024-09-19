FROM tgagor/centos
RUN yum -y update
RUN yum -y install httpd procps
COPY httpd.conf /etc/httpd/conf/
RUN useradd www
RUN chown -R www:www /var/run/httpd /var/log/httpd
USER www 
CMD httpd -DFOREGROUND