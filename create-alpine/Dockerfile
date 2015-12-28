FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV ALPINE_VERSION=v3.3
VOLUME /chroot
ADD build /usr/bin/build
RUN chmod +x /usr/bin/build

ENTRYPOINT ["build"]
