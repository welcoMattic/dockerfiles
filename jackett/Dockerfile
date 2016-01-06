FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

ENV JACKETT_VER=0.7.102 PORT=5000 UID=991 GID=991

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add -U curl-dev mono@testing && \
	mkdir -p /opt && cd /opt && wget https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VER}/Jackett.Binaries.Mono.tar.gz && \
	tar xzf Jackett.Binaries.Mono.tar.gz && rm -rf /opt/*.tar.gz /var/cache/apk/*

EXPOSE 5000

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
