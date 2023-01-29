#! /bin/bash

docker run --rm -p 80:80 -dit --name nginx \
    -v "$PWD/enabled":/etc/nginx/conf.d \
    nginx
