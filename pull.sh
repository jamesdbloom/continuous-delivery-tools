#/bin/bash

docker -H "tcp://192.168.10.10:2375" pull ubuntu
docker -H "tcp://192.168.10.10:2375" pull dockerfile/java
docker -H "tcp://192.168.10.10:2375" pull java