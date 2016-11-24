#!/bin/bash

# Check version
VERSION_NODE_LATEST=$(grep "NODE_VER=" latest/Dockerfile | cut -d"=" -f2)
VERSION_NODE_LTS=$(grep "NODE_VER=" lts/Dockerfile | cut -d"=" -f2)
NEW_VERSION_NODE_LATEST=$(curl https://nodejs.org/en/ 2> /dev/null| grep 'home-downloadbutton' | grep 'Current' | sed 's/.*Download //;s/ Current.*//')
NEW_VERSION_NODE_LTS=$(curl https://nodejs.org/en/ 2> /dev/null| grep 'home-downloadbutton' | grep 'LTS' | sed 's/.*Download //;s/ LTS.*//')

f_gen_tag() {
    VERSION=$1
    VERSION_NODE=$(echo $2 | cut -d"v" -f2)

    TAGS="${VERSION} ${VERSION_NODE} $(echo ${VERSION_NODE} | cut -d'.' -f '1 2') $(echo ${VERSION_NODE} | cut -d'.' -f '1')"
    TAGS_ONBUILD="${VERSION}-onbuild ${VERSION_NODE}-onbuild $(echo ${VERSION_NODE} | cut -d'.' -f '1 2')-onbuild $(echo ${VERSION_NODE} | cut -d'.' -f '1')-onbuild"
    if [ "${VERSION}" == "latest" ]; then
        TAGS_ONBUILD="onbuild ${TAGS_ONBUILD}"
    fi
}

f_maj_dockerfile() {
    VERSION=$1
    VERSION_NODE=$2
    NEW_VERSION_NODE=$3
    ONBUILD_FROM=$(echo $3 | cut -d"v" -f2)
    BUILD_VER=$(date +%Y%m%d01)

    ## Edit dockerfile
    sed -i 's/NODE_VER=.*/NODE_VER='${NEW_VERSION_NODE}'/;
        s/tags=".*"/tags="'"${TAGS}"'"/;
        s/build_ver=".*"/build_ver="'${BUILD_VER}'"/' ${VERSION}/Dockerfile
    
    ## Edit onbuild dockerfile
    sed -i 's/FROM xataz\/node:.*/FROM xataz\/node:'${ONBUILD_FROM}'/;
        s/tags=".*"/tags="'"${TAGS_ONBUILD}"'"/;
        s/build_ver=".*"/build_ver="'${BUILD_VER}'"/' ${VERSION}-onbuild/Dockerfile
}

f_maj_readme() {
    VERSION=$1
    TAGS=$(echo $TAGS | sed 's/ /, /g')
    TAGS_ONBUILD=$(echo $TAGS_ONBUILD | sed 's/ /, /g')

   sed -i 's#\* .*'${VERSION}'/Dockerfile)#\* '"${TAGS}"' \[(Dockerfile)\](https://github.com/xataz/dockerfiles/blob/master/node/'${VERSION}'/Dockerfile)#;
       s#\* .*'${VERSION}'-onbuild/Dockerfile)#\* '"${TAGS_ONBUILD}"' \[(Dockerfile)\](https://github.com/xataz/dockerfiles/blob/master/node/'${VERSION}'-onbuild/Dockerfile)#' README.md
}


if [ "${VERSION_NODE_LATEST}" != "${NEW_VERSION_NODE_LATEST}" ]; then
    f_gen_tag latest ${NEW_VERSION_NODE_LATEST}
    f_maj_dockerfile latest ${VERSION_NODE_LATEST} ${NEW_VERSION_NODE_LATEST}
    f_maj_readme latest
fi

if [ "${VERSION_NODE_LTS}" != "${NEW_VERSION_NODE_LTS}" ]; then
    f_gen_tag lts ${NEW_VERSION_NODE_LTS}
    f_maj_dockerfile lts ${VERSION_NODE_LTS} ${NEW_VERSION_NODE_LTS}
    f_maj_readme lts
fi
