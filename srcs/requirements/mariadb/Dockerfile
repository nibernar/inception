# MariaDB est un système de gestion de base de données.

# Indique l'OS sur lequel l'image Docker mariaDB sera construite.
From debian:bullseye

# Définition des arguments pour la création de la base de données.
ARG DB_USER
ARG DB_DATABASE
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD

# Mise à jour du système de paquets.
RUN apt-get update -y
RUN apt-get upgrade -y

# Installation de MariaDB. option -y pour dire oui et automatiser le docker.
RUN apt-get install mariadb-server -y


# Crée le répertoire /var/run/mysql. Stock les fichiers de socket.
RUN mkdir -p /var/run/mysql

# Change le propriétaire du répertoire /var/run/mysql à l'utilisateur MySQL.
# Assure que MariaDB a les permissions nécessaires pour accéder à ce répertoire.
RUN chown -R mysql:mysql /var/run/mysql

# Démarre le service MariaDB, puis exécute une série de commandes SQL pour créer une base de données
# et un utilisateur, donne tous les droits à l'utilisateur puis FLUSH pour actualiser la table des privilèges.
RUN service mariadb start && mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_DATABASE}; \
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${DB_DATABASE}.* TO '${DB_USER}'@'%'; \
    FLUSH PRIVILEGES;"

# Envoi le ficher de configuration mariadb.conf au répertoire de configuration de MariaDB.
COPY ./conf/mariadb.conf ./etc/mysql/mariadb.conf.d/50-serveur.conf

# Permet aux autres conteneurs ou à des applications externes de se connecter à MariaDB via ce port.
EXPOSE 3306

# Définit la commande par défaut à exécuter lorsque le conteneur démarre.
# "--bind-address=0.0.0.0" : écoute les connexions entrantes sur tout le réseau de la machine hôte (VM).
CMD ["mariadbd", "--bind-address=0.0.0.0"]