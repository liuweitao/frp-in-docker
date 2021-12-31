FROM alpine:latest

ADD ./frp/frps /usr/bin/

RUN mkdir /etc/frp

ENTRYPOINT frps -c /etc/frp/frps.ini
