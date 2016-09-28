FROM xataz/glibc:2.23
MAINTAINER xataz <https://github.com/xataz>

ARG GO_VER=1.7.1

ENV UID=991 \
    GID=991 \
    GO_URL=https://storage.googleapis.com/golang

LABEL description="Golang based on alpine" \
      tags="1.7.1 1.7 1 latest" \
      build_ver="2016092801"

RUN BUILD_DEPS="wget \
                tar \
                ca-certificates" \
    && apk add -U ${BUILD_DEPS} \
                    git \
                    su-exec \
                    tini \
    && wget ${GO_URL}/go${GO_VER}.linux-amd64.tar.gz -O /tmp/go${GO_VER}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf /tmp/go${GO_VER}.linux-amd64.tar.gz \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/*

COPY startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["version"]
