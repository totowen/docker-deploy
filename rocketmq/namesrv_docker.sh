#! /bin/bash

ROCKETMQ_DIR=`pwd`
docker stop mqnamesrv
docker rm mqnamesrv

docker run -d \
--privileged=true \
--name rmqnamesrv \
-p 9876:9876 \
-v ./nameserver/logs:/home/rocketmq/logs \
-v ./nameserver/store:/root/store \
-e "MAX_HEAP_SIZE=256M" \
-e "HEAP_NEWSIZE=128M" \
-e "MAX_POSSIBLE_HEAP=100000000" \
apache/rocketmq sh mqnamesrv

