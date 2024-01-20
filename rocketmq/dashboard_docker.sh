#! /bin/bash

ROCKETMQ_DIR=`pwd`
docker stop rocketmq-console
docker rm rocketmq-console

docker run -p 8087:8080 \
 --name rocketmq-console \
 -d \
 -e "JAVA_OPTS=-Drocketmq.namesrv.addr=192.168.3.82:9876" \
 -t apacherocketmq/rocketmq-dashboard

