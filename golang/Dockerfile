FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV GO_URL=https://storage.googleapis.com/golang \
    GO_VER=1.6 \
    UID=991 \
    GID=991 \
    GLIBC_URL=https://github.com/andyshinn/alpine-pkg-glibc/releases/download/unreleased \
    GLIBC_VER=2.23-r1 

RUN BUILD_DEPS="wget \
                tar "\
    && apk add -U ${BUILD_DEPS} \
    && wget --no-check-certificate ${GLIBC_URL}/glibc-${GLIBC_VER}.apk -O /tmp/glibc-${GLIBC_VER}.apk \
    && wget --no-check-certificate ${GLIBC_URL}/glibc-bin-${GLIBC_VER}.apk -O /tmp/glibc-bin-${GLIBC_VER}.apk \
    && wget --no-check-certificate ${GO_URL}/go${GO_VER}.linux-amd64.tar.gz -O /tmp/go${GO_VER}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf /tmp/go${GO_VER}.linux-amd64.tar.gz \
    && apk add --allow-untrusted /tmp/glibc-${GLIBC_VER}.apk /tmp/glibc-bin-${GLIBC_VER}.apk \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/*

COPY golang /usr/bin/golang
RUN chmod +x /usr/bin/golang

ENTRYPOINT ["tini", "--", "/usr/bin/golang"]
