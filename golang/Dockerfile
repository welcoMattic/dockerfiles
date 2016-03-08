FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV GO_VER=1.6 \
    UID=991 \
    GID=991

RUN BUILD_DEPS="wget \
                tar" \
    && apk add -U ${BUILD_DEPS} \
    && cd /tmp \
    && wget https://storage.googleapis.com/golang/go${GO_VER}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go${GO_VER}.linux-amd64.tar.gz \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/*

COPY golang /usr/bin/golang
RUN chmod +x /usr/bin/golang

WORKDIR /app/src
ENTRYPOINT ["tini", "--", "gosu", "${UID}:${GID}", "/usr/bin/golang"]
