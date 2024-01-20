#! /bin/bash

ROCKETMQ_DIR=`pwd`
docker stop rmqbroker
docker rm rmqbroker

docker run -d \
 --name rmqbroker \
 --link rmqnamesrv:namesrv \
 -p 10911:10911 \
 -p 10909:10909 \
 --privileged=true \
 -v ./broker/logs:/root/logs \
 -v ./broker/store:/root/store \
 -v ./broker/conf/broker.conf:/home/rocketmq/broker.conf \
 -e "MAX_POSSIBLE_HEAP=200000000" \
 -e "MAX_HEAP_SIZE=512M" \
 -e "HEAP_NEWSIZE=256M" \
 -e "NAMESRV_ADDR=namesrv:9876" \
 apache/rocketmq \
 sh mqbroker -c /home/rocketmq/broker.conf

