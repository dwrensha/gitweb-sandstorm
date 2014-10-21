#! /bin/sh

echo "starting http server..."
#httpd -f /etc/httpd/conf/httpd.conf
apachectl start
echo "started http server."
sleep infinity
