#!/bin/bash

mkdir -p /run/php/
touch /run/php/php7.4-fpm.pid

if ! [ -f /var/www/wordpress/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	cd /var/www/wordpress
	sleep 10
	wp core config	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
			        	--dbhost=$WP_HOST
	sleep 5

	wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_NAME} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_MAIL} --skip-email
	wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_PASSWORD --allow-root

	cd /
fi

exec /usr/sbin/php-fpm7.4 -F