#!/bin/sh

set -xe

/usr/sbin/fcgiwrap -f -s tcp:127.0.0.1:9000 &

/usr/sbin/nginx

sleep infinity
