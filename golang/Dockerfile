FROM xataz/glibc:2.23
MAINTAINER xataz <https://github.com/xataz>

ARG GO_VER=1.7

ENV UID=991 \
    GID=991 \
    GO_URL=https://storage.googleapis.com/golang

LABEL description="Golang based on alpine" \
      tags="1.7.0 1.7 1 latest" \
      build_ver="$(date +%Y%m%d)"

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

WORKDIR /usr/app/src
ENTRYPOINT ["exec", "su-exec", "${UID}:${GID}", "/usr/bin/golang"]
