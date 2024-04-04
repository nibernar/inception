From debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN mkdir -p /etc/nginx/ssl && apt-get install openssl -y
RUN openssl req -x509 -newkey rsa:2048 -nodes -subj /c=FR -keyout /etc/ssl/nibernar.42.fr.key -out /etc/ssl/nibernar.42.fr.crt

COPY ./conf/nginx.conf /etc/nginx/sites-available/nibernar.42.fr.conf

RUN echo "include /etc/nginx/sites-available/nibernar.42.fr.conf;" > /etc/nginx/sites-enabled/nibernar.42.fr.conf;

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]