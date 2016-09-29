FROM alpine:latest

MAINTAINER Gwenn Etourneau <gwenn.etourneau@gmail.com>

RUN apk upgrade
RUN apk add --update \
    bash \
    git \
    tar \
    openssh-client \
    openssh \
    jq \
    curl \
    zip
RUN curl -sSL "http://cli.run.pivotal.io/stable?release=linux64-binary&version=6.18.1&source=github-rel"  -o cf-cli_amd64.tar.gz
RUN gzip -dc cf-cli_amd64.tar.gz | tar xf -
RUN mv cf /bin && chmod +x /bin/cf


RUN curl -sSL "https://github.com/coryb/yj/releases/download/0.0.2/yj-linux-amd64"  -o yj-linux-amd64
RUN mv yj-linux-amd64 /bin/yj && chmod +x /bin/yj
