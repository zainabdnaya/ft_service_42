#!/bin/sh

openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root -e "create database wordpress;CREATE USER 'zainab'@'%' IDENTIFIED BY 'dnaya'; GRANT ALL ON *.* TO 'zainab'@'%';FLUSH PRIVILEGES;"
/etc/init.d/mariadb stop

supervisord -c /etc/supervisord.conf