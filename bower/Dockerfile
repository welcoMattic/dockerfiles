FROM xataz/node:5
MAINTAINER xataz <https://github.com/xataz>

ENV UID=991 \
    GID=991

RUN apk add -U git \
        make \
        gcc \
        g++ \
        python \
        linux-headers \
    && npm install -g bower

COPY entrypoint /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["entrypoint"]
