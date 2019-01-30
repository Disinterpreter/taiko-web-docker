#!/bin/bash

echo 127.0.0.1 localhost > /etc/hosts

# "/var/tmp/nginx" owned by "nginx" user is unusable on heroku dyno so re-create on runtime
mkdir /var/tmp/nginx

envsubst \$PORT < /nginx-template/taiko-web.template > /etc/nginx/sites-enabled/taiko-web
sed -i -E "s/^user .*/user $(whoami);/" /etc/nginx/nginx.conf
supervisord -n

