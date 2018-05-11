FROM ogomez/java-docker
LABEL maintainer="Pavel Skvortsov <skv.pavel@gmail.com>"

ENV BCTLS_VERSION=159

RUN apk add --quiet --no-progress --update python python-dev py-pip build-base unzip

RUN set -ex && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/unlimited_jce_policy.zip "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
    unzip -jo -d ${JAVA_HOME}/jre/lib/security /tmp/unlimited_jce_policy.zip && \
    wget https://bouncycastle.org/download/bctls-jdk15on-${BCTLS_VERSION}.jar -P ${JAVA_HOME}/jre/lib/ext && \
    echo -e "security.provider.10=org.bouncycastle.jce.provider.BouncyCastleProvider" >> ${JAVA_HOME}/jre/lib/security/java.security

RUN set -ex && \
    pip install --quiet awscli docker-compose && \
    rm -rf /var/cache/apk/*
