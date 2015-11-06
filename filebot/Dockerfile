FROM xataz/java
MAINTAINER xataz <xataz@mondedie.fr>

ENV FB_VER=4.6

RUN apk add --update wget unzip && \
  cd /tmp && \
  wget http://downloads.sourceforge.net/project/filebot/filebot/FileBot_${FB_VER}/FileBot_${FB_VER}-portable.zip && \
  unzip FileBot_${FB_VER}-portable.zip && mv FileBot_${FB_VER}-portable /opt/filebot && \
  apk del wget unzip && rm -rf /tmp/* /var/cache/apk/*
  
ENTRYPOINT ["/opt/filebot/filebot.sh"]
