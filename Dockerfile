FROM kadock/s6:edge

RUN apk add --no-cache libgcc libstdc++ musl hugo git openssh-client git-lfs

RUN true \
  && mkdir /root/.ssh \
  && echo "Host *" >> /root/.ssh/config \
  && echo "  BatchMode=yes" >> /root/.ssh/config \
  && echo "  StrictHostKeyChecking=accept-new" >> /root/.ssh/config \
  && echo "  IdentityFile ~/.ssh/id_rsa" >> /root/.ssh/config \
  && chown -R root:root /root/.ssh \
  && chmod -R go= /root/.ssh

COPY update-site /etc/periodic/daily/update-site
RUN chmod +x /etc/periodic/daily/update-site
COPY 00-clone-missing-repo /etc/cont-init.d/
RUN chmod +x /etc/cont-init.d/00-clone-missing-repo

CMD ["/usr/sbin/crond", "-f", "-d", "8"]
