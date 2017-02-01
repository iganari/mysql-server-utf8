#!/bin/bash

set -eu ### debug option is "-xeu"

    IMAGE_NAME='mysql-server-utf8'
CONTAINER_NAME='iganari-mysql'
DB_ROOT_PASSWD="${1}"

### create docker container without cache
docker build --no-cache .


### add tag 
docker tag $(docker images -q | head -1) ${IMAGE__NAME}


### running mysql container with mysql_root_password
docker run --privileged --name ${CONTAINER_NAME} -e MYSQL_ROOT_PASSWORD=${DB_ROOT_PASSWD} -d ${IMAGE__NAME}


### access into docker container(echo)
echo "docker exec -it ${CONTAINER_NAME} mysql -uroot -p${DB_ROOT_PASSWD}"
