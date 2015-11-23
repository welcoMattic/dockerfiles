FROM debian:jessie
MAINTAINER xataz <https://github.com/xataz>

ENV LUTIM_CONTACT=contact@domain.tld LUTIM_SECRET=dmjamzdijzmoj LUTIM_MAX_FILE_SIZE=10000000000 UID=991 GID=991

EXPOSE 8181
VOLUME /data
WORKDIR /lutim

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade -y && \
	PKG_BUILD="build-essential git libssl-dev" && apt-get install -y cpanminus perl perlmagick ${PKG_BUILD} && \
	cpanm Carton && cd / && git clone https://git.framasoft.org/luc/lutim.git && cd lutim && \
	carton install && cp /lutim/lutim.conf.template /lutim/lutim.conf && \
	sed -i 's/#contact/contact/' /lutim/lutim.conf && \
	/usr/local/bin/carton exec hypnotoad /lutim/script/lutim && \
	sleep 5 && kill -9 $(ps aux | grep lutim | grep -v grep | awk '{print $2}') && \
	apt-get autoremove --purge -y ${PKG_BUILD} && apt-get clean -y && \
	rm -rf /root/.cpan/* /root/.cpanm/* 

ADD lutim.conf /lutim/lutim.conf
ADD startup /usr/bin/startup
RUN chmod +x /usr/bin/startup

CMD ["/usr/bin/startup"]
