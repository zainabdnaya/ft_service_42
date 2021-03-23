#!/bin/sh
openrc
touch /run/openrc/softlevel
service nginx start
/bin/sh
