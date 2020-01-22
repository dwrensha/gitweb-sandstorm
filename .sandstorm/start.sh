#!/bin/sh

set -xe

mkdir -p /var/lib/nginx
mkdir -p /var/log/nginx
mkdir -p /var/run

mkdir -p /var/repo.git

cd /var/repo.git
git --bare init --shared
ln -sf /opt/app/post-receive-hook.sh hooks/post-receive
git config --file config http.receivepack true
git config --file config receive.denyNonFastForwards false
git update-server-info

cat > description << __EOF__
A git repository hosted in a Sandstorm grain. Pushes to the gw-pages branch are published.
__EOF__

cat config

cd /

/continue.sh
