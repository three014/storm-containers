ARG ARCH=
#FROM arm64v8/ubuntu:20.04
FROM ${ARCH}ubuntu:20.04

RUN <<EOF
apt-get update && apt-get install -y --no-install-recommends apt-utils
apt-get install openjdk-8-jre-headless -y
apt-get install curl tar vim unzip -y
apt-get install python -y
EOF

RUN <<EOF
mkdir -p /home/cc
curl -o /home/cc/storm.tar.gz https://dlcdn.apache.org/storm/apache-storm-1.2.4/apache-storm-1.2.4.tar.gz
tar xzf /home/cc/storm.tar.gz
rm /home/cc/storm.tar.gz
curl -o /tmp/riot-bench.zip -L https://github.com/dream-lab/riot-bench/archive/refs/heads/master.zip
unzip /tmp/riot-bench.zip -d /home/cc/storm/
rm /tmp/riot-bench.zip
mv /home/cc/storm/riot-bench-master /home/cc/storm/riot-bench
EOF

WORKDIR /home/cc/storm

ADD configure.sh /
