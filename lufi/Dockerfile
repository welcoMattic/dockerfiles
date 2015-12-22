FROM xataz/alpine:3.3
MAINTAINER xataz <https://github.com/xataz>

RUN apk add -U git build-base perl perl-dev perl-crypt-rijndael wget && \
    cpan install Carton && cd / && git clone https://git.framasoft.org/luc/lufi.git && \
    cd /lufi && carton install && \
    apk del build-base perl-dev wget git && rm -rf /var/cache/apk/* /root/.cpan/* /root/.cpanm/* && rm -rf /lufi/local/cache/* /lufi/utilities
    

VOLUME /files

EXPOSE 8080
WORKDIR /lufi

ENV GID=991 UID=991 CONTACT=contact@domain.tld WEBROOT=/

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
