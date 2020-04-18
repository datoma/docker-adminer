FROM alpine:latest

LABEL maintainer="datoma - https://github.com/datoma"

ENV ADMINER_VERSION=4.7.6
ENV MEMORY=1G
ENV UPLOADMAXFILE=128M
ENV POSTMAXFILE=128M

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add \
        wget \
        ca-certificates \
        php7@testing \
        php7-session@testing \
        php7-mysqli@community \
        php7-pgsql@testing \
        php7-json@testing \
        php7-pecl-mongodb@testing \
        dumb-init && \
        wget https://github.com/vrana/adminer/releases/download/v$ADMINER_VERSION/adminer-$ADMINER_VERSION.php -O /srv/index.php && \
    apk del wget ca-certificates && \
    rm -rf /var/cache/apk/*

WORKDIR /srv
EXPOSE 80

ENTRYPOINT ["dumb-init", "--"]

CMD /usr/bin/php \
    -d memory_limit=$MEMORY \
    -d upload_max_filesize=$UPLOADMAXFILE \
    -d post_max_size=$POSTMAXFILE \
    -S 0.0.0.0:80
