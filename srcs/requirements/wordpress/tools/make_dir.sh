#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir -p ~/data
        mkdir -p  ~/data/mariadb
        mkdir -p ~/data/wordpress
fi

wp core install --allow-root --path=./ \
	--url=$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_NAME \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL;

wp user create --allow-root --path=./ \
	$WP_USER_NAME \
	$WP_USER_EMAIL \
	--user_pass=$WP_USER_PASSWORD;

wp theme activate twentytwentytwo --allow-root --path=./;
#	wp core download --allow-root
#    	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
#    	wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
#    	wp user create $WP_USER_NAME $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
#   	wp theme install inspiro --activate --allow-root

exec "$@";
