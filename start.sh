#! /bin/sh

mkdir -p /var/lib/nginx
mkdir -p /var/log/nginx
mkdir -p /var/run

mkdir -p /var/git

cd /var/git
git --bare init --shared
git config --file config http.receivepack true
git update-server-info

cat config

cd /

sh continue.sh
