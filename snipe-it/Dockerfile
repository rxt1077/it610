FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y git php composer php-curl php-ldap php-bcmath php-xml php-gd libapache2-mod-php
RUN git clone https://github.com/snipe/snipe-it /var/www/snipe-it
WORKDIR /var/www/snipe-it
RUN composer install --no-dev --prefer-source
COPY .env /var/www/snipe-it
RUN rm /etc/apache2/sites-enabled/000-default.conf
COPY 000-snipe-it.conf /etc/apache2/sites-enabled/
RUN chown -R www-data /var/www/snipe-it
RUN a2enmod rewrite
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]