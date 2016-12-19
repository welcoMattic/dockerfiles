#!/bin/bash

REDIS_VERSION=$(grep "REDIS_VER=" stable/Dockerfile | cut -d"=" -f2)
NEW_REDIS_VERSION=$(curl https://redis.io/download 2> /dev/null | grep "http://download.redis.io/releases/redis-" | head -1 | sed "s|^.*/redis-\(.*\).tar.gz'>|\1|")


f_gen_tag() {
    VERSION=$1

    TAGS="latest stable ${VERSION} $(echo ${VERSION} | cut -d'.' -f '1 2') $(echo ${VERSION} | cut -d'.' -f '1')"
    TAGS_CLI="latest-cli stable-cli ${VERSION}-cli $(echo ${VERSION} | cut -d'.' -f '1 2')-cli $(echo ${VERSION} | cut -d'.' -f '1')-cli"
}

f_maj_dockerfile() {
    BUILD_VER=$(date +%Y%m%d01)

    ## Edit dockerfile
    sed -i 's/REDIS_VER=.*/REDIS_VER='${NEW_REDIS_VERSION}'/;
        s/tags=".*"/tags="'"${TAGS}"'"/;
        s/build_ver=".*"/build_ver="'${BUILD_VER}'"/' stable/Dockerfile

    ## Edit dockerfile cli
    sed -i 's/REDIS_VER=.*/REDIS_VER='${NEW_REDIS_VERSION}'/;
        s/tags=".*"/tags="'"${TAGS_CLI}"'"/;
        s/build_ver=".*"/build_ver="'${BUILD_VER}'"/' stable-cli/Dockerfile
}

f_maj_readme() {
    VERSION=$1
    TAGS=$(echo $TAGS | sed 's/ /, /g')

    sed -i 's#\* .*stable/Dockerfile)#\* '"${TAGS}"' \[(Dockerfile)\](https://github.com/xataz/dockerfiles/blob/master/redis/stable/Dockerfile)#;
            s#\* .*stable-cli/Dockerfile)#\* '"${TAGS_CLI}"' \[(Dockerfile)\](https://github.com/xataz/dockerfiles/blob/master/redis/stable-cli/Dockerfile)#' README.md
}

if [ "${REDIS_VERSION}" != "${NEW_REDIS_VERSION}" ]; then
    echo "Update redis to ${NEW_REDIS_VERSION}"
    f_gen_tag ${NEW_REDIS_VERSION}
    f_maj_dockerfile
    f_maj_readme
fi