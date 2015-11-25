FROM alpine:3.2
MAINTAINER xataz <https://github.com/xataz>

ENV GID=991 UID=991
RUN apk add --update git && rm -rf /var/cache/apk/*

ADD entrypoint /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["entrypoint"]
CMD ["help", "-a"]
