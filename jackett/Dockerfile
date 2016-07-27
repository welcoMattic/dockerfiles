FROM xataz/mono:latest
MAINTAINER xataz <https://github.com/xataz>

ARG JACKETT_VER=0.7.296

ENV UID=991 \
    GID=991

LABEL description="Jackett based on alpine" \
      tags="0.7.296 0.7 latest" \
      build_ver="2016072701"

RUN apk add -U curl-dev \
	&& mkdir -p /opt \
    && cd /opt \
    && wget https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VER}/Jackett.Binaries.Mono.tar.gz \
    && tar xzf Jackett.Binaries.Mono.tar.gz \
    && rm -rf /opt/*.tar.gz /var/cache/apk/*

EXPOSE 9117

COPY startup /usr/bin/startup
COPY ServerConfig.json /tmp/ServerConfig.json
RUN chmod +x /usr/bin/startup

CMD ["tini","--","startup"]
