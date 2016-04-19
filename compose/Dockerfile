FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ARG COMPOSE_VER=1.7.0

ENV UID=991 \
    GID=991

LABEL description="docker-compose based on alpine" \
      build_ver="2016041901"

RUN apk add -U python \
            py-setuptools \
            py-pip \
    && pip install --no-cache-dir docker-compose==${COMPOSE_VER} \
    && apk del py-pip \
    && rm -rf /var/cache/apk/*

COPY entrypoint /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["-v"]
