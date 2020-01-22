#!/bin/sh
set -e
while read oldrev newrev refname
do
  if [ "$refname" = "refs/heads/gw-pages" ]
  then
    [ -e /var/www ] || mkdir -p /var/www
    git --work-tree=/var/www/ checkout --force --detach $refname
    git --work-tree=/var/www/ clean --force
    /opt/app/sandstorm/bin/getPublicId $HTTP_X_SANDSTORM_SESSION_ID
  fi
done
