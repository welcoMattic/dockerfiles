FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ENV UID=991 \
    GID=991 \
    USER=openssh

LABEL description="sshd based on alpine" \
      tags="latest" \
      build_ver="2016092901"

RUN apk add -U openssh \
                s6 \
                su-exec \
                rsync \
    && rm -rf /var/cache/apk/*

COPY rootfs /
RUN chmod +x /usr/local/bin/startup /etc/s6.d/*/*
EXPOSE 2222

ENTRYPOINT ["/usr/local/bin/startup"]
