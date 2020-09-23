FROM centos
RUN yum -y update
RUN yum -y install httpd
RUN useradd www
RUN chown -R www.www /var/run/httpd
RUN chown -R www.www /var/log/httpd
COPY httpd.conf /etc/httpd/conf/
USER www
CMD httpd -DFOREGROUND
