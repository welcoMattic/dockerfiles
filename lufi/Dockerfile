FROM debian:jessie
MAINTAINER xataz <https://github.com/xataz>

ENV GID=991 UID=991 SECRET=0423bab3aea2d87d5eedd9a4e8173618 CONTACT=contact@domain.tld MAX_FILE_SIZE=1000000000 WEBROOT=/

RUN apt-get update && apt-get upgrade \
    && BUILD_DEPS="build-essential ca-certificates git" \
    && apt-get install -y --no-install-recommends --no-install-suggests \
            perl \
            ${BUILD_DEPS} \
    && cpan install Carton \
    && cd / \
    && git clone https://git.framasoft.org/luc/lufi.git \
    && cd /lufi \
    && carton install \
    && apt-get purge -y ${BUILD_DEPS} \
    && apt-get autoremove --purge -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /root/.cpan* /lufi/local/cache/* /lufi/utilities
    
VOLUME /files /data

EXPOSE 8080

ADD startup /usr/bin/startup
ADD lufi.conf /lufi/lufi.conf
RUN chmod +x /usr/bin/startup

CMD ["startup"]
