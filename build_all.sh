#!/bin/bash

usage() {
	echo "Usage: $(basename $0) [-u registry-username]"
}

# build Apache Storm images for Docker
# change to your username
use_local=""
username=""
arch=""

while getopts ':u:' OPT; do
	case "${OPTION}" in
		u)
			echo "Using registry ${OPTARG}"
			use_local="false"
			username="${OPTARG}"
			;;
		h)
			usage
			exit 0
			;;
		*)
			usage
			exit 1
			;;
	esac
done

if [ "$use_local" = "" ]; then
	echo "Using localhost registry"
	username="localhost:5000"
	docker run -d -p 5000:5000 --restart=always --name registry registry:2
	if [ "$?" -ne 125 ]; then
		exit "$?"
	fi
fi


case "$(arch)" in
	x86_64)
		arch='amd64/' ;;
	aarch64)
		arch='arm64v8/' ;;
	*)
		echo "unsupported architecture"
		exit 1
		;;
esac

docker image rm -f `docker image ls | grep ${username} | awk '{print $3}'` || true
docker image rm -f `docker image ls | grep none | awk '{print $3}'` || true

docker build -t ${username}/storm-base base --build-arg ARCH="${arch}"
base_tag=`docker image ls | grep ${username}/storm | grep latest | grep base | awk '{print $3}'`
docker tag $base_tag ${username}/storm-base:latest
docker push ${username}/storm-base:latest

docker build -t ${username}/storm-nimbus nimbus --build-arg USERNAME="${username}"
docker build -t ${username}/storm-worker supervisor --build-arg USERNAME="${username}"
docker build -t ${username}/storm-ui ui --build-arg USERNAME="${username}"
docker build -t ${username}/zookeeper zookeeper --build-arg ARCH="${arch}"
docker build -t ${username}/mqtt mqtt --build-arg ARCH="${arch}"

nimbus_tag=`docker image ls | grep ${username}/storm | grep latest | grep nimbus | awk '{print $3}'`
ui_tag=`docker image ls | grep ${username}/storm | grep latest | grep ui | awk '{print $3}'`
worker_tag=`docker image ls | grep ${username}/storm | grep latest | grep worker | awk '{print $3}'`
zookeeper_tag=`docker image ls | grep latest | grep zookeeper | awk '{print $3}'`
mqtt_tag=`docker image ls | grep latest | grep mqtt | awk '{print $3}'`

docker tag $nimbus_tag ${username}/storm-nimbus:latest
docker tag $ui_tag ${username}/storm-ui:latest
docker tag $worker_tag ${username}/storm-worker:latest
docker tag $zookeeper_tag ${username}/zookeeper:latest
docker tag $mqtt_tag ${username}/mqtt:latest

docker push ${username}/storm-nimbus:latest
docker push ${username}/storm-ui:latest
docker push ${username}/storm-worker:latest
docker push ${username}/zookeeper:latest
docker push ${username}/mqtt:latest
