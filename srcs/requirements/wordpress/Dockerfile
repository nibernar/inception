
FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget -y

RUN apt-get install php -y
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN mkdir -p /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod 777 wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY /conf/launchWordpress.sh /tmp
COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod 777 /tmp/launchWordpress.sh

EXPOSE 9000

RUN mkdir -p /run/php

CMD ["/tmp/launchWordpress.sh"]
