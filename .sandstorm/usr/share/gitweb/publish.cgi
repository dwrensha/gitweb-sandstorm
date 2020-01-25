#!/bin/sh
echo 'Content-type: text/plain'
echo ''
echo '(re)publishing the gw-pages branch...'
exec 2>&1
cd /var/repo.git

# The post-receive hook expects input of the form "oldSha1 newSha1 refName".
# Currently the commit shas are ignored, so just use a fake 40-digit hex val.
echo 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' \
     'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' \
     'refs/heads/gw-pages' | /opt/app/post-receive-hook.sh

echo ''


