FROM ogomez/java-docker
LABEL maintainer="Pavel Skvortsov <skv.pavel@gmail.com>"

RUN apk add --quiet --no-progress --update python python-dev py-pip build-base

RUN set -ex && \
    pip install --quiet awscli docker-compose && \
    rm -rf /var/cache/apk/*
