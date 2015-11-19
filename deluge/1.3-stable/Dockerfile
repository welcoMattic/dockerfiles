FROM alpine:3.2
MAINTAINER xataz <https://github.com/xataz/>

ENV DELUGE_VER=1.3-stable

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add --update bash python py-setuptools py-six py-mako py-cffi@testing py-chardet \
		xdg-utils py-xdg@testing py-gtk libtorrent-rasterbar@testing py-openssl \
		py-twisted py-cryptography@testing py-enum34 py-pip librsvg git supervisor && \
	pip install service_identity && cd / && git clone -b ${DELUGE_VER} git://deluge-torrent.org/deluge.git && \
	cd /deluge && python setup.py build && python setup.py install && \
	apk del py-pip git && rm -rf /var/cache/apk/* /deluge && \
	addgroup -g 5000 torrent && adduser -h /home/torrent -s /bin/sh -D -G torrent -u 5000 torrent

EXPOSE 53160
EXPOSE 53160/udp
EXPOSE 8112
EXPOSE 58846

VOLUME ["/data", "/config"]

ENV WEB_ROOT=/

ADD rootfs /
RUN chmod +x /usr/bin/startup
RUN cp -r /config /config-bck

CMD ["/usr/bin/startup"]
