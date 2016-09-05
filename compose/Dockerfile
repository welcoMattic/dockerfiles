FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG COMPOSE_VER=1.8.0

ENV UID=991 \
    GID=991

LABEL description="docker-compose based on alpine" \
      tags="1.8.0 1.8 latest" \
      build_ver="2016090501"

RUN apk add -U python \
            py-setuptools \
            py-pip \
    && pip install --no-cache-dir docker-compose==${COMPOSE_VER} \
    && apk del py-pip \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["su-exec", "${UID}:${GID}", "docker-compose"]
CMD ["version"]
