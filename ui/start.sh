#!/bin/sh

/configure.sh ${ZOOKEEPER_SERVICE_HOST:-$1} ${NIMBUS_SERVICE_HOST:-$2}

exec /home/cc/storm/bin/storm ui
