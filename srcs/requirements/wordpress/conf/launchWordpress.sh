#!/bin/bash

sleep 10;

file="/var/www/html/wordpress/wp-config.php"

if [ ! -f "$file" ]
then
    cd /var/www/html/wordpress/

    wp core download --allow-root

    wp config create --allow-root --dbname=$DB_DATABASE --dbuser=$DB_USER --dbpass=$DB_USER_PASSWORD --dbhost=$HOST

    wp core install --allow-root --url=$WP_DOMAIN --title=$TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_MAIL

    #chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R
fi
mkdir -p /run/php/
php-fpm7.4 -F
