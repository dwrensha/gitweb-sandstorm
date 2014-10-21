#! /bin/sh

mkdir -p /var/git
mkdir -p /var/lib/nginx
mkdir -p /var/log/nginx
mkdir -p /var/log/httpd
mkdir -p /var/run/httpd


cd /var/git
git --bare init --shared
git config --file config http.receivepack true
git update-server-info

cat config

cd /

sh continue.sh
