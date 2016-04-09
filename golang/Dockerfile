FROM xataz/glibc:2.23
MAINTAINER xataz <https://github.com/xataz>

ARG GO_URL=https://storage.googleapis.com/golang
ARG GO_VER=1.6

ENV UID=991 \
    GID=991 

RUN BUILD_DEPS="wget \
                tar \
                ca-certificates"\
    && apk add -U ${BUILD_DEPS} git \
    && wget ${GO_URL}/go${GO_VER}.linux-amd64.tar.gz -O /tmp/go${GO_VER}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf /tmp/go${GO_VER}.linux-amd64.tar.gz \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/*

COPY golang /usr/bin/golang
RUN chmod +x /usr/bin/golang

ENTRYPOINT ["tini", "--", "/usr/bin/golang"]
