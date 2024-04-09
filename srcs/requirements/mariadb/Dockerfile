From debian:bullseye

ARG DB_USER
ARG DB_DATABASE
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysql

RUN chown -R mysql:mysql /var/run/mysql

RUN service mariadb start && mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_DATABASE}; \
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${DB_DATABASE}.* TO '${DB_USER}'@'%'; \
    FLUSH PRIVILEGES;"

COPY ./conf/mariadb.conf ./etc/mysql/mariadb.conf.d/50-serveur.conf

CMD ["mariadbd", "--bind-address=0.0.0.0"]
