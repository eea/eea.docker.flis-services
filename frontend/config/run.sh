#!/usr/bin/env bash

#Update default.conf with env variables
sed -i s/{{SERVER_NAME}}/$SERVER_NAME/ /etc/nginx/conf.d/default.conf
sed -i s/{{PREFIX}}/$PREFIX/ /etc/nginx/conf.d/default.conf

#Run nginx server
cd /etc/nginx
nginx -g "daemon off;"
