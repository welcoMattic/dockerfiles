#!/bin/bash

GO_VERSION=$(grep "GO_VER=" Dockerfile | cut -d"=" -f2)
NEW_GO_VERSION=$(curl https://golang.org/dl/ 2> /dev/null | grep '<span class="filename">' | head -1 | sed 's|  <span class="filename">go\(.*\).windows-amd64.msi</span>|\1|')
GLIBC_VERSION=$(grep "GLIBC_VER=" Dockerfile | cut -d"=" -f2)
NEW_GLIBC_VERSION=$(curl https://github.com/sgerrand/alpine-pkg-glibc/releases/latest 2> /dev/null | sed 's#.*tag/##;s#">.*##')


f_gen_tag() {
    VERSION=$1

    TAGS="latest ${VERSION} $(echo ${VERSION} | cut -d'.' -f '1 2') $(echo ${VERSION} | cut -d'.' -f '1')"
}

f_maj_dockerfile() {
    BUILD_VER=$(date +%Y%m%d01)

    ## Edit dockerfile
    sed -i 's/GO_VER=.*/GO_VER='${NEW_GO_VERSION}'/;
        s/GLIBC_VER=.*/GLIBC_VER='${NEW_GLIBC_VERSION}'/;
        s/glibc_ver=".*"/glibc_ver="'"${NEW_GLIBC_VERSION}"'"/;
        s/golang_ver=".*"/golang_ver="'"${NEW_GO_VERSION}"'"/;
        s/tags=".*"/tags="'"${TAGS}"'"/;
        s/build_ver=".*"/build_ver="'${BUILD_VER}'"/' Dockerfile
    
}

f_maj_readme() {
    VERSION=$1
    TAGS=$(echo $TAGS | sed 's/ /, /g')

    sed -i 's#\* .*/Dockerfile)#\* '"${TAGS}"' \[(Dockerfile)\](https://github.com/xataz/dockerfiles/blob/master/golang/Dockerfile)#;
            s#\* GO_VER : Golang version.*)#\* GO_VER : Golang version (default : '${NEW_GO_VERSION}')#;
            s#\* GLIBC_VER : GLIBC version.*)#\* GLIBC_VER : GLIBC version (default : '${NEW_GLIBC_VERSION}')#' README.md
}

if [ "${GO_VERSION}" != "${NEW_GO_VERSION}" ] || [ "${MEDIAINFO_VERSION}" != "${NEW_MEDIAINFO_VERSION}" ]; then
    echo "Update golang to ${NEW_GO_VERSION}"
    f_gen_tag ${NEW_GO_VERSION}
    f_maj_dockerfile
    f_maj_readme
fi