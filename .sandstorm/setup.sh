#!/bin/bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y nginx git fcgiwrap
unlink /etc/nginx/sites-enabled/default


