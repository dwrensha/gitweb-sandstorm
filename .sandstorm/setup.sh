#!/bin/bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y nginx git fcgiwrap libcgi-pm-perl \
        libcapnp-dev busybox-static capnproto pkg-config clang
rm -rf /etc/nginx/sites-enabled/default


# TODO: debian-stretch has only capnproto v 0.5 but we need 0.6 or better
pushd /tmp
curl --silent https://ftp.gnome.org/ubuntu/ubuntu/pool/main/c/capnproto/libcapnp-dev_0.7.0-5_amd64.deb -O
curl --slient http://ftp.ubuntu.com/ubuntu/ubuntu/pool/universe/c/capnproto/capnproto_0.7.0-5_amd64.deb -O
sudo dpkg -i libcapnp-dev_0.7.0-5_amd64.deb capnproto_0.7.0-5_amd64.deb
popd
