FROM alpine:edge

RUN apk add --no-cache libgcc libstdc++ musl hugo git

RUN mkdir -p /tmp/source
RUN mkdir -p /tmp/dest

WORKDIR /tmp/source

ENTRYPOINT ["/usr/bin/hugo", "-D", "-d", "/tmp/dest", "--cleanDestinationDir"]
