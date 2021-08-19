FROM geerlingguy/php-apache:latest

RUN rm /var/www/html/index.html
COPY index.php /var/www/html/index.php

COPY ./apache.conf /etc/apache2/sites-enabled/000-default.conf
