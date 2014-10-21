#! /bin/sh

echo "starting fcgiwrap..."
fcgiwrap -f -s tcp:127.0.0.1:9000 &
echo "started fcgiwrap: " $?

echo "starting http server..."
#httpd -f /etc/httpd/conf/httpd.conf -e debug
#apachectl start
/usr/bin/nginx
echo "started http server."
sleep infinity
