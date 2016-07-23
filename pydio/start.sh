#!/bin/bash


# Create our SSL directory
# in case it doesn't exist
yum update -y
bash /bin/mkcert.sh
chmod -R a+rw /var/lib/pydio/plugins/boot.conf /var/cache/pydio /var/lib/pydio/files /var/lib/pydio/personal /var/lib/pydio/public

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/apachectl -DFOREGROUND
