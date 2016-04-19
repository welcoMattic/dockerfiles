FROM xataz/mono:latest
MAINTAINER xataz <https://github.com/xataz>

ARG JACKETT_VER=0.7.228

ENV UID=991 \
    GID=991

LABEL description="Jackett based on alpine" \
      build_ver="2016041901"

RUN apk add -U curl-dev \
	&& mkdir -p /opt \
    && cd /opt \
    && wget https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VER}/Jackett.Binaries.Mono.tar.gz \
    && tar xzf Jackett.Binaries.Mono.tar.gz \
    && rm -rf /opt/*.tar.gz /var/cache/apk/*

EXPOSE 9117

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["tini","--","startup"]
