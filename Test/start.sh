#!/bin/sh

mv /home/cc/zookeeper/conf/zoo_sample.cfg /home/cc/zookeeper/conf/zoo.cfg

exec /home/cc/zookeeper/bin/zkServer.sh start

tail -f /dev/null
