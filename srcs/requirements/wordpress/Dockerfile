

# Indique l'OS sur lequel l'image Docker mariaDB sera construite.
FROM debian:bullseye

# Mise à jour du système de paquets.
RUN apt-get update -y
RUN apt-get upgrade -y

# instalation du paquets wget qui permet de telecharger des fihiers depuis internet
RUN apt-get install wget -y

# instalation des paquets php pour interagir avec des bases de donnees MySQL/MariaDB
RUN apt-get install php -y
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y

# commande pour telecharger wordpress via un lien URL
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN mkdir -p /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY /conf/launchWordpress.sh /tmp
COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 777 /tmp/launchWordpress.sh

# Permet aux autres conteneurs ou à des applications externes de se connecter à wordpress via ce port.
EXPOSE 9000

RUN mkdir -p /run/php

# Définit la commande par défaut à exécuter lorsque le conteneur démarre.
CMD ["/tmp/launchWordpress.sh"]
