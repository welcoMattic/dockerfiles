FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG DOCKER_VER=1.12.5

ENV UID=991 \
    GID=991

LABEL description="docker client for drone.io based on alpine" \
      tags="1.12.5 1.12 latest" \
      build_ver="2016110701"


RUN BUILD_DEPS="go \
                gcc \
                make \
                libc-dev" \
    && apk add -U git \
                    bash \
                    ${BUILD_DEPS} \
                    tini \
                    su-exec \
                    curl \
    && git clone -b v${DOCKER_VER} https://github.com/docker/docker /tmp/docker \
    && export AUTO_GOPATH=1 \
    && cd /tmp/docker \
    && ./hack/make.sh binary-client \
    && cd / \
    && cp /tmp/docker/bundles/${DOCKER_VER}/binary-client/docker-${DOCKER_VER} /usr/local/bin/docker \
    && apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/* /tmp/*

COPY startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["bash"]
