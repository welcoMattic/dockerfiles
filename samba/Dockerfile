FROM xataz/alpine:3.4
MAINTAINER xataz <https://github.com/xataz>

LABEL description="samba based on alpine" \
      tags="latest" \
      build_ver="2016072701"

EXPOSE 137 138 139 445

RUN apk add -U \
            samba \
            samba-common-tools \
            acl \
            bc \
            supervisor

COPY rootfs /
RUN chmod +x /usr/bin/startup   

CMD ["tini","--","/usr/bin/startup"]        
