FROM alpine:latest

RUN apk add --update tftp-hpa && rm -rf /var/cache/apk/* && chmod 777 /var/tftpboot

EXPOSE 69/udp

VOLUME ["/var/tftpboot"]

CMD ["/usr/sbin/in.tftpd", "--foreground", "--user tftp", "--address 0.0.0.0:69", "--secure", "/var/tftpboot"]

