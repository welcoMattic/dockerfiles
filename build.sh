#!/bin/bash
# this is kind of an expensive check, so let's not do this twice if we
# are running more than one validate bundlescript

REPO='https://gogs.boxobox.xyz/xataz/dockerfiles.git'
BRANCH='master'
USER='xataz'
DOCKER_PUSH=$1

CSI="\033["
CEND="${CSI}0m"
CRED="${CSI}1;31m"
CGREEN="${CSI}1;32m"
CYELLOW="${CSI}1;33m"
CBLUE="${CSI}1;34m"

git fetch -q "$REPO" "refs/heads/$BRANCH"

# build the changed dockerfiles
for f in $(git diff HEAD~ --diff-filter=ACMRTUX --name-only | cut -d"/" -f1 | uniq); do
    if [ -d $f ]; then
        if [ ! -x $f/build.sh ]; then
            chmod +x $f/build.sh
        fi
        ./$f/build.sh $DOCKER_PUSH
    fi
done
