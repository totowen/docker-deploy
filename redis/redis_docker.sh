#!/bin/bash
#

containerName="redis"
docker stop $containerName
docker rm $containerName

docker run \
	-d \
	--name $containerName \
	-p 6379:6379 \
	--restart unless-stopped \
	-v /root/redis/data:/data \
	-v /root/redis/conf/redis.conf:/etc/redis/redis.conf \
	-d redis:bullseye redis-server /etc/redis/redis.conf
