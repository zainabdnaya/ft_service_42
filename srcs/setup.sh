openrc;
touch /run/openrc/softlevel;
rc-service nginx start;
curl https://localhost --insecure;
