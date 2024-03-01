#!/bin/sh

mv /home/cc/zookeeper/conf/zoo_sample.cfg /home/cc/zookeeper/conf/zoo.cfg

echo > /home/cc/zookeeper/conf/zoo.cfg

cat >> /home/cc/zookeeper/conf/zoo.cfg <<EOF
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/tmp/zookeeper
clientPort=2181
EOF


exec /home/cc/zookeeper/bin/zkServer.sh start