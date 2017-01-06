FROM alpine:latest

RUN apk add --update tftp-hpa && rm -rf /var/cache/apk/* && chmod 777 /var/tftpboot && \
	rm /etc/default/tftpd-hpa && touch /etc/default/tftpd-hpa && \
	echo 'TFTP_USERNAME="tftp"' >>  /etc/default/tftpd-hpa && \
	echo 'TFTP_DIRECTORY="/var/tftpboot"' >>  /etc/default/tftpd-hpa && \
	echo 'TFTP_ADDRESS="0.0.0.0:69"' >>  /etc/default/tftpd-hpa && \
	echo 'TFTP_OPTIONS="-s -c -l"' >>  /etc/default/tftpd-hpa && \

EXPOSE 69/udp

VOLUME ["/var/tftpboot"]

CMD ["/usr/sbin/in.tftpd"]

