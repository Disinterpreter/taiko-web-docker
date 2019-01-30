#!/bin/bash

echo 127.0.0.1 localhost > /etc/hosts

envsubst \$PORT < /nginx-template/taiko-web.template > /etc/nginx/conf.d/*.conf

nginx

supervisord -n

