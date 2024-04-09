# Nginx est un serveur web utilisé pour héberger des sites web.

# Indique l'OS sur lequel l'image Docker mariaDB sera construite.
From debian:bullseye

# Mise à jour du système de paquets.
RUN apt-get update -y
RUN apt-get upgrade -y

# Installation de Nginx. option -y pour dire oui et automatiser le docker.
RUN apt-get install nginx -y

# SSL est un protocole de communications sur Internet. 
# Chiffre les données échangées entre un navigateur web et un serveur web.
RUN mkdir -p /etc/nginx/ssl && apt-get install openssl -y

# Permet de configurer des certificats SSL/TLS.
RUN openssl req -x509 -newkey rsa:2048 -nodes -subj /c=FR -keyout /etc/ssl/nibernar.42.fr.key -out /etc/ssl/nibernar.42.fr.crt

# Transfère le fichier nginx.conf de l'hôte vers le conteneur Nginx.
COPY ./conf/nginx.conf /etc/nginx/sites-available/nibernar.42.fr.conf

# Permet à Nginx de charger et d'utiliser la configuration nginx.conf
RUN echo "include /etc/nginx/sites-available/nibernar.42.fr.conf;" > /etc/nginx/sites-enabled/nibernar.42.fr.conf;

# Permet aux autres conteneurs ou à des applications externes de se connecter à Nginx via ce port.
EXPOSE 443

# Définit la commande par défaut à exécuter lorsque le conteneur démarre.
CMD ["nginx", "-g", "daemon off;"]