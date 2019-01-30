#!/bin/bash

echo 127.0.0.1 localhost > /etc/hosts
echo $(hostname) >> /etc/hosts
#sed -i '/::1/d' /etc/hosts
# sed: cannot rename /etc/sedIsLrKZ: Device or resource busy
# rofl wtf it that?
service nginx restart
cd /srv/taiko-web && python3 server.py 34802 &
cd /srv/taiko-web && gunicorn -b 127.0.0.1:34801 app:app

