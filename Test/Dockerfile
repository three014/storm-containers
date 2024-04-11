FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install openjdk-8-jre-headless -y

RUN mkdir -p /home/cc

ADD zookeeper /home/cc/zookeeper

WORKDIR /home/cc/zookeeper/bin

EXPOSE 2181

ADD start.sh /

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
