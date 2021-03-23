#!/bin/sh
openrc
touch /run/openrc/softlevel
service php-fpm7 start
service nginx start
/bin/sh
