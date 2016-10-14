FROM alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

ARG JACKETT_VER=0.7.420

ENV UID=991 \
    GID=991

LABEL description="Jackett based on alpine" \
      tags="0.7.420 0.7 latest" \
      build_ver="2016100101"

RUN apk add -U wget \
            libcurl \
            ca-certificates \
            s6 \
            su-exec \
    && apk add -U --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ mono \
    && wget https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VER}/Jackett.Binaries.Mono.tar.gz -O /tmp/Jackett.Binaries.Mono.tar.gz \
    && tar xzf /tmp/Jackett.Binaries.Mono.tar.gz -C /usr \
    && apk del wget \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 9117

COPY rootfs /
RUN chmod +x /usr/local/bin/startup /etc/s6.d/*/*

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["s6-svscan", "/etc/s6.d"]
