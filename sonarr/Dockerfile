FROM debian:wheezy
MAINTAINER xataz <https://github.com/xataz>

ENV UID=991 GID=911 WEBROOT=/sonarr

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
  echo "deb http://apt.sonarr.tv/ develop main" | tee -a /etc/apt/sources.list && \
  apt-get update -q && \
  apt-get install -qy nzbdrone mediainfo && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8989
EXPOSE 9898
VOLUME /config

ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

ADD sonarr-update.sh /usr/bin/sonarr-update.sh
RUN chmod 777 /usr/bin/sonarr-update.sh 

ADD config.xml /tmp/config.xml

ENTRYPOINT ["startup"]
