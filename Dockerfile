FROM alpine:latest

RUN apk add --update tftp-hpa && rm -rf /var/cache/apk/* && chmod 777 /var/tftpboot

EXPOSE 69/udp

VOLUME ["/var/tftpboot"]

ENTRYPOINT ["in.tftpd"]

CMD ["-L", "--verbose", "-u", "root", "--secure", "--create", "/var/tftpboot"]


