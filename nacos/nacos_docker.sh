#! /bin/bash

NACOS_DIR=`pwd`
docker stop nacos
docker rm nacos

docker run -d --restart always \
 -p 8848:8848 \
 -p 9848:9848 \
 -p 9849:8849 \
--name nacos \
--env MODE=standalone \
--network single01_default \
--env SPRING_DATASOURCE_PLATFORM=mysql \
--env MYSQL_SERVICE_HOST=my-mysql_01 \
--env MYSQL_SERVICE_PORT=3306 \
--env MYSQL_SERVICE_DB_NAME=nacos-config \
--env MYSQL_SERVICE_USER=root \
--env MYSQL_SERVICE_PASSWORD=test \
-v ./conf:/home/nacos/conf \
-v ./logs:/home/nacos/logs \
-v ./data:/home/nacos/data \
nacos/nacos-server:latest
