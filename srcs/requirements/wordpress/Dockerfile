FROM debian:bullseye
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install wget -y
RUN apt-get install php7.4 -y
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install curl -y
RUN apt-get install php-mysqli -y
RUN apt-get install mariadb-client -y
RUN wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.2.tar.gz && rm wordpress-6.4.2.tar.gz && cd /
RUN chown -R www-data:www-data /var/www/wordpress
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/cli_script.sh /cli_script.sh
RUN chmod +x /cli_script.sh
CMD ["/cli_script.sh"]