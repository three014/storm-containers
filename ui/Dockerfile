ARG USERNAME=
FROM ${USERNAME}/storm-base:latest

ADD start.sh /

EXPOSE 8080

WORKDIR /home/cc/storm

ENTRYPOINT ["/start.sh"]
