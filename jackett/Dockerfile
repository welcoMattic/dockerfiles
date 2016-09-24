FROM xataz/mono:latest
MAINTAINER xataz <https://github.com/xataz>

ARG JACKETT_VER=0.7.363

ENV UID=991 \
    GID=991

LABEL description="Jackett based on alpine" \
      tags="0.7.363 0.7 latest" \
      build_ver="$(date +%Y%m%d)"

RUN apk add -U curl-dev \
        ca-certificates \
        wget \
	&& mkdir -p /opt \
    && cd /opt \
    && wget https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VER}/Jackett.Binaries.Mono.tar.gz \
    && tar xzf Jackett.Binaries.Mono.tar.gz \
    && apk del ca-certificates wget \
    && rm -rf /opt/*.tar.gz /var/cache/apk/*

EXPOSE 9117

COPY startup /usr/bin/startup
COPY ServerConfig.json /tmp/ServerConfig.json
RUN chmod +x /usr/bin/startup

CMD ["tini","--","startup"]
