#!/bin/bash

echo 127.0.0.1 localhost > /etc/hosts

envsubst \$PORT < /nginx-template/taiko-web.template > /etc/nginx/conf.d/*.conf

cd /srv/taiko-web/ && python tools/taikodb_hash.py taiko.db public/songs

nginx

supervisord -n

