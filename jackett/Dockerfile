FROM xataz/mono:latest
MAINTAINER xataz <https://github.com/xataz>

ARG JACKETT_VER=0.7.398

ENV UID=991 \
    GID=991

LABEL description="Jackett based on alpine" \
      tags="0.7.398 0.7 latest" \
      build_ver="2016092301"

RUN BUILD_DEPS="wget \
                curl-dev" \
    && apk add -U ${BUILD_DEPS} \
            libcurl \
            ca-certificates \
            s6 \
            su-exec \
	&& mkdir -p /opt \
    && cd /opt \
    && wget https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VER}/Jackett.Binaries.Mono.tar.gz \
    && tar xzf Jackett.Binaries.Mono.tar.gz \
    && apk del wget curl-dev \
    && rm -rf /opt/*.tar.gz /var/cache/apk/*

EXPOSE 9117

COPY rootfs /
RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["s6-svscan", "/etc/s6.d"]
