FROM scratch
MAINTAINER xataz <https://github.com/xataz>

ADD rootfs.tar.gz /
RUN echo "@community http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories

CMD ["sh"]
