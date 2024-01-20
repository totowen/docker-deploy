#!/bin/bash
#

containerName="mysql"
docker stop $containerName
docker rm $containerName

docker run \
	-d \
	-p 3306:3306 \
	--restart unless-stopped \
	--name $containerName \
       	-v /mysqldata/mysql/data:/var/lib/mysql \
       	-e MYSQL_DATABASE=xunqin \
	-e MYSQL_ROOT_PASSWORD=Xunqin@123 mysql:5.7 
