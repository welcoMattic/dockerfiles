FROM xataz/filebot
MAINTAINER xataz <xataz@mondedie.fr>

VOLUME ["/data"]
CMD ["/usr/bin/start.sh"]
ADD rootfs /

RUN addgroup -g 5000 torrent && adduser -h /home/torrent -D -G torrent -u 5000 torrent && chmod +x /usr/bin/start.sh && \
    	apk add --update transmission-daemon && \
	rm /var/cache/apk/*
