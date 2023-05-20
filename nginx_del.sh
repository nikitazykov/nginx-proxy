#!/bin/bash

Z=$1
PROJECT=$2

rm -f /server/nginx-proxy/conf.d/$Z-$PROJECT.conf

docker restart nginx-proxy