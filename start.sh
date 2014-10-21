#! /bin/sh

mkdir -p /var/git
mkdir -p /var/log/httpd
mkdir -p /var/run

cd /var/git
git init --bare .

sh /continue.sh
