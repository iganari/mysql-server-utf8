# How to Use

### (pullとか)キャッシュせず、新たにDockerfileから作成する

```
$ docker build --no-cache .
```

### tagをつける

```
$ docker tag $(docker images -q | head -1) igaguri/mysql-server
```

### rootのパスワードを設定して起動

```
$ docker run --name iganari-db -e MYSQL_ROOT_PASSWORD=hogehoge -d  igaguri/mysql-server
```

### コンテナにアクセス

```
$ docker exec -it iganari-db mysql -uroot -phogehoge
```
