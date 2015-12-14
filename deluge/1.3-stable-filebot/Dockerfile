FROM xataz/filebot 
MAINTAINER xataz <https://github.com/xataz/>

ENV DELUGE_VER=1.3-stable UID=991 GID=991

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add --update bash python build-base python-dev py-setuptools py-six py-mako py-chardet \
		xdg-utils py-gtk libtorrent-rasterbar@testing py-openssl \
		py-twisted py-enum34 openssl-dev py-pip librsvg libffi-dev git supervisor && \
	pip install service_identity pyxdg cffi cryptography && \
	cd / && git clone -b ${DELUGE_VER} git://deluge-torrent.org/deluge.git && \
	cd /deluge && python setup.py build && python setup.py install && \
	apk del py-pip git build-base libffi-dev openssl-dev python-dev && rm -rf /var/cache/apk/* /deluge

EXPOSE 53160
EXPOSE 53160/udp
EXPOSE 8112
EXPOSE 58846

VOLUME ["/data", "/config"]

ENV WEB_ROOT=/
ADD rootfs /

RUN chmod +x /usr/bin/startup
RUN chmod +x /usr/bin/postdl && chmod +x /usr/bin/postrm
RUN cp -r /config /config-bck

CMD ["/usr/bin/startup"]
