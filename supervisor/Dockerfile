ARG USERNAME=
FROM ${USERNAME}/storm-base:latest

ADD start.sh /

EXPOSE 6700 

WORKDIR /home/cc/storm

ENTRYPOINT ["/start.sh"]
