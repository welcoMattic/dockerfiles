FROM debian:jessie
MAINTAINER xataz <https://github.com/xataz>

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade -y

RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y openssl postfix postfix-mysql dovecot-core dovecot-imapd dovecot-lmtpd \
	dovecot-mysql opendkim opendkim-tools opendmarc dovecot-sieve dovecot-managesieved \
	clamav-milter supervisor


ADD rootfs /
VOLUME /mail /ssl
RUN chmod +x /usr/bin/startup 
ENV UID=5000 GID=5000 DOMAIN=domain.tld FQDN=mail.domain.tld 


CMD ["/usr/bin/startup"]
