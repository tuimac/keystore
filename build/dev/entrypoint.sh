#!/bin/bash

cd /root/keystore/src/frontend
npm start &

cd /root/keystore/src/backend

while true; do
    PGPASSWORD=password psql -U keystore -h postgres -c "\l" > /dev/null
    if [ `echo $?` -eq 0 ]; then
        break
    fi
done

python3 manage.py makemigrations --no-input
python3 manage.py migrate
python3 manage.py migrate --fake
python3 manage.py runserver 0.0.0.0:8000 &

/usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
