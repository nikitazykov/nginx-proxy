#!/bin/bash

Z=$1
PROJECT=$2
HOST="$Z-$PROJECT.$DOMAIN"

NGINX_CONF=$(cat /server/nginx-proxy/conf.d/.conf_blank)   > /dev/null
NGINX_CONF=${NGINX_CONF//XXX.XX/$HOST.ru}
NGINX_CONF=${NGINX_CONF//CCCC/$DOMAIN}
echo "${NGINX_CONF//PPP/43$3}" > /server/nginx-proxy/conf.d/$Z-$PROJECT.conf

docker restart nginx-proxy