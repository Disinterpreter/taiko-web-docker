#!/bin/bash

service nginx restart
cd /srv/taiko-web && python3 server.py 34802 &
cd /srv/taiko-web && gunicorn -b 127.0.0.1:34801 app:app

