#!/bin/bash

echo 127.0.0.1 localhost > /etc/hosts

supervisord -n

