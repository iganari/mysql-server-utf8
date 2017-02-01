#!/bin/bash

set -xeu

DB_ROOT_PASSWD="${1}"

### (pullとか)キャッシュせず、新たにDockerfileから作成する

docker build --no-cache .

### tagをつける

docker tag $(docker images -q | head -1) igaguri/mysql-server

### rootのパスワードを設定して起動

docker run --privileged --name iganari-db -e MYSQL_ROOT_PASSWORD=${DB_ROOT_PASSWD} -d  igaguri/mysql-server

### コンテナにアクセス

echo "docker exec -it iganari-db mysql -uroot -p${DB_ROOT_PASSWD}"
