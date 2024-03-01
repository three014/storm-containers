FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install openjdk-8-jre-headless -y

RUN mkdir -p /home/cc

ADD start.sh /

ADD zookeeper /home/cc/zookeeper

WORKDIR /home/cc/zookeeper

ENTRYPOINT ["start.sh"]