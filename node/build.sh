#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1
CSI="\033["
CEND="${CSI}0m"
CRED="${CSI}1;31m"
CGREEN="${CSI}1;32m"
CYELLOW="${CSI}1;33m"
CBLUE="${CSI}1;34m"

# Download dependencies
docker pull xataz/alpine:3.4

build() {
    image_name=$1
    image_dir=$2

    echo -e "${CBUILD}Build ${image_name} on ${image_dir}${CEND}"
    docker build -t ${image_name} ${image_dir}  > /tmp/build.log 2>&1
    if [ $? == 0 ]; then
      echo -e "${CGREEN}                       ---                                   "
      echo -e "Successfully built ${image_name} with context ${image_dir}"
      echo -e "                       ---                                   ${CEND}"
      if [ "$DOCKER_PUSH" == "push" ]; then
        echo -e "${CYELLOW}Push ${image_name}${CEND}"
        docker push ${image_name}
        echo -e "${CYELLOW}                       ---                                   "
        echo -e "Successfully push ${USER}/${image_name}:${tag}"
        echo -e "                       ---                                   ${CEND}"
      fi
    else
      echo -e "${CRED}                       ---                                   "
      echo -e "Failed built ${USER}/${image_name}:${tag} with context ${image_dir}"
      cat /tmp/build.log
      echo -e "                       ---                                   ${CEND}"
      exit 1
    fi

}

# Build node
## Latest
for tag in $(grep 'tags=' $FOLDER/latest/Dockerfile | cut -d'"' -f2); do
    build "xataz/node:$tag" "$FOLDER/latest/"
done
for tag in $(grep 'tags=' $FOLDER/latest-onbuild/Dockerfile | cut -d'"' -f2); do
    build "xataz/node:$tag" "$FOLDER/latest/"
done

## LTS
for tag in $(grep 'tags=' $FOLDER/lts/Dockerfile | cut -d'"' -f2); do
    build "xataz/node:$tag" "$FOLDER/latest/"
done
for tag in $(grep 'tags=' $FOLDER/lts-onbuild/Dockerfile | cut -d'"' -f2); do
    build "xataz/node:$tag" "$FOLDER/latest/"
done
