#!/bin/sh

mkdir /home/cc/storm/data

cat >> /home/cc/storm/conf/storm.yaml <<EOF
storm.local.dir: "/home/cc/storm/data"
EOF

if [ -n "$1" ]; then
   cat >> /home/cc/storm/conf/storm.yaml <<EOF
storm.zookeeper.servers:
- "$1"
EOF
fi

if [ -n "$2" ]; then
   cat >> /home/cc/storm/conf/storm.yaml <<EOF
nimbus.seeds: ["$2"]
EOF
fi   

cat /home/cc/storm/conf/storm.yaml
