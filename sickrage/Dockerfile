FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

LABEL description="sickrage based on alpine" \
      tags="latest" \
      build_ver="2016111001"

ENV WEBROOT="/" \
    UID="991" \
    GID="991"

RUN apk add -U python \
                py-pip \
                git \
                s6 \
                su-exec \
                unrar \
    && pip install cheetah \
    && git clone https://github.com/SickRage/SickRage.git \
    && apk del py-pip \
    && rm -rf /var/cache/apk/* ~/.pip/cache/*

COPY rootfs /
RUN chmod +x /usr/local/bin/startup /etc/s6.d/*/*

VOLUME ["/config"]
EXPOSE 8081

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["/bin/s6-svscan", "/etc/s6.d"]
