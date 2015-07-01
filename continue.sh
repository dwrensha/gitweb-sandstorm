#! /bin/sh

set -xe

fcgiwrap -f -s tcp:127.0.0.1:9000 &

/usr/bin/nginx

sleep infinity
