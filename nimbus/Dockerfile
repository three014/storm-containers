ARG USERNAME=
FROM ${USERNAME}/storm-base:latest

ADD start.sh /

EXPOSE 3772 6627

WORKDIR /home/cc/storm

ENTRYPOINT ["/start.sh"]
