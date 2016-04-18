FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ARG COMPOSE_VER=1.7.0

ENV UID=991 \
    GID=991

RUN apk add -U python \
            py-setuptools \
            py-pip \
    && pip install docker-compose==${COMPOSE_VER} \
    && apk del py-pip \
    && rm -rf /var/cache/apk/*

COPY entrypoint /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["-v"]
