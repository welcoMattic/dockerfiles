FROM alpine:3.2
MAINTAINER <https://github.com/xataz>

RUN echo "@edge http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
	apk add --update redis && rm -rf /var/cache/apk/* && \
	deluser redis && addgroup -g 991 redis && adduser -h /var/lib/redis -s /bin/sh -u 991 -D -G redis redis redis && \
	chown -R redis:redis /var/lib/redis 

CMD ["su","-","redis","-c","redis-server"]
