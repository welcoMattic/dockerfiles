FROM alpine:3.2
MAINTAINER xataz <https://github.com/xataz>

ENV MYSQL_VER=5.6.27

RUN PKG_BUILD="make wget gcc g++ cmake ncurses ncurses-dev libaio libaio-dev" && \
	apk add --update ${PKG_BUILD} && \
	cd /tmp && wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-${MYSQL_VER}.tar.gz && \
	tar xzf mysql-${MYSQL_VER}.tar.gz && cd mysql-${MYSQL_VER} && cmake . && make && make install
