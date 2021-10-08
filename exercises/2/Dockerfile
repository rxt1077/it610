FROM centos
RUN yum -y update
RUN yum -y install httpd
COPY httpd.conf /etc/httpd/conf/
RUN groupadd www
RUN useradd -g www www
RUN chown -R www.www /var/run/httpd /var/log/httpd
USER www
CMD httpd -DFOREGROUND
