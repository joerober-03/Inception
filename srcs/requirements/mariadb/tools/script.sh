#!/bin/bash

service mariadb start

sleep 5

mariadb -u root -e "CREATE DATABASE ${SQL_DATABASE};"
mariadb -u root -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

mysqld_safe