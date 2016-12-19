#!/bin/bash

COMPOSE_VERSION=$(grep "COMPOSE_VER=" Dockerfile | cut -d"=" -f2)
NEW_COMPOSE_VERSION=$(curl https://github.com/docker/compose/releases/latest 2> /dev/null | sed 's#.*tag/##;s#">.*##')


f_gen_tag() {
    VERSION=$1

    TAGS="latest ${VERSION} $(echo ${VERSION} | cut -d'.' -f '1 2') $(echo ${VERSION} | cut -d'.' -f '1')"
}

f_maj_dockerfile() {
    BUILD_VER=$(date +%Y%m%d01)

    ## Edit dockerfile
    sed -i 's/COMPOSE_VER=.*/COMPOSE_VER='${NEW_COMPOSE_VERSION}'/;
        s/tags=".*"/tags="'"${TAGS}"'"/;
        s/build_ver=".*"/build_ver="'${BUILD_VER}'"/' Dockerfile
    
}

f_maj_readme() {
    VERSION=$1
    TAGS=$(echo $TAGS | sed 's/ /, /g')

    sed -i 's#\* .*/Dockerfile)#\* '"${TAGS}"' \[(Dockerfile)\](https://github.com/xataz/dockerfiles/blob/master/compose/Dockerfile)#' README.md
}

if [ "${COMPOSE_VERSION}" != "${NEW_COMPOSE_VERSION}" ]; then
    echo "Update compose to ${NEW_COMPOSE_VERSION}"
    f_gen_tag ${NEW_COMPOSE_VERSION}
    f_maj_dockerfile
    f_maj_readme
fi