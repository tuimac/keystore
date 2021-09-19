#!/bin/bash

cd /root/keystore/src/frontend
npm start &

/usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
