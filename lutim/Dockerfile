FROM debian:jessie
MAINTAINER xataz <https://github.com/xataz>

ENV GID=991 UID=991 CONTACT=contact@domain.tld WEBROOT=/ SECRET=e7c0b28877f7479fe6711720475dcbbd MAX_FILE_SIZE=10000000000

RUN apt-get update && apt-get upgrade \
    && BUILD_DEPS="make gcc ca-certificates libssl-dev git" \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        perl \
        ca-certificates \
        shared-mime-info \
        perlmagick \
        ${BUILD_DEPS} \
    && cpan install Carton \
    && cd / \
    && git clone https://git.framasoft.org/luc/lutim.git \
    && cd /lutim && carton install \
    && apt-get purge -y ${BUILD_DEPS} \
    && apt-get autoremove --purge -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /root/.cpan* /lutim/local/cache/* /lufi/utilities

VOLUME /lutim/files /data

EXPOSE 8181

ADD lutim.conf /lutim/lutim.conf
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["startup"]
