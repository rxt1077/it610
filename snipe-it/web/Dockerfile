# Do we want to look at building off of php-apache?
FROM ubuntu:20.04

# If we don't set this, apt-get prompts us to put in the timezone
ENV DEBIAN_FRONTEND=noninteractive

# Install ubuntu packages
RUN apt-get update
RUN apt-get install -y git php composer php-curl php-ldap php-bcmath php-xml php-gd libapache2-mod-php php-mysql

# Get Snipe-IT code
RUN git clone --branch v5.2.0 https://github.com/snipe/snipe-it /var/www/snipe-it
RUN chown -R www-data /var/www/snipe-it
WORKDIR /var/www/snipe-it

# Install PHP dependencies
RUN composer install --no-dev --prefer-source

# Put _our_ Snipe-IT configuration into the image
COPY .env /var/www/snipe-it

# Removing default Apache config and putting in _our_ Apache config
RUN rm /etc/apache2/sites-enabled/000-default.conf
COPY 000-snipe-it.conf /etc/apache2/sites-enabled/
# Snipe-IT REQUIRES setting up the rewrite mod in Apache
RUN a2enmod rewrite

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]