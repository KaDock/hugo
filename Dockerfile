FROM alpine:edge

RUN apk add --no-cache libgcc libstdc++ musl hugo git openssh-client

RUN true \
  && mkdir /root/.ssh \
  && echo "Host *" >> /root/.ssh/config \
  && echo "  BatchMode=yes" >> /root/.ssh/config \
  && echo "  StrictHostKeyChecking=accept-new" >> /root/.ssh/config \
  && echo "  IdentityFile ~/.ssh/id_rsa" >> /root/.ssh/config \
  && chown -R root:root /root/.ssh \
  && chmod -R go= /root/.ssh

COPY update-site /etc/periodic/daily/update-site

CMD ["/usr/sbin/crond", "-f", "-d", "8"]
