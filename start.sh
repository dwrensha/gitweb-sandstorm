#! /bin/sh

set -x

mkdir -p /var/lib/nginx
mkdir -p /var/log/nginx
mkdir -p /var/run

mkdir -p /var/repo.git

cd /var/repo.git
git --bare init --shared
git config --file config http.receivepack true
git update-server-info

cat config

cd /

source continue.sh
