FROM alpine:3.2
MAINTAINER <https://github.com/xataz>

ENV UID=991 GID=991

RUN echo "@edge http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
	apk add --update redis && rm -rf /var/cache/apk/* 

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
