FROM amd64/alpine

ADD ./frp/frpc /usr/bin/

RUN mkdir /etc/frp

ENTRYPOINT frpc -c /etc/frp/frpc.ini