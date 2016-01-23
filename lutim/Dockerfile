FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

RUN apk add -U openssl-dev openssl git build-base perl perl-dev perl-crypt-rijndael wget && \
    cpan install Carton && cd / && git clone https://git.framasoft.org/luc/lutim.git && \
    cd /lutim && carton install && \
    apk del build-base perl-dev wget git && rm -rf /var/cache/apk/* /root/.cpan/* /root/.cpanm/*

VOLUME /files

EXPOSE 8181
VOLUME /data
WORKDIR /lutim

ENV GID=991 UID=991 CONTACT=contact@domain.tld WEBROOT=/ =dmjamzdijzmoj LUTIM_MAX_FILE_SIZE=10000000000

ADD lutim.conf /lutim/lutim.conf
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
