FROM alpine:3.23
LABEL author="JamesClonk <jamesclonk@jamesclonk.ch>"

RUN apk --no-cache add ca-certificates go curl bash unzip jq git

RUN addgroup -g 501 kiro && \
    adduser -u 501 -G kiro -h /home/kiro -s /bin/bash -D kiro
RUN USER=kiro && \
    GROUP=kiro && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.6.0/fixuid-0.6.0-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml
USER kiro:kiro

RUN curl -fsSL https://cli.kiro.dev/install | bash

ENV PATH="/home/kiro/.local/bin:${PATH}"
ENV PATH="/home/kiro/bin:${PATH}"
VOLUME /home/kiro/.kiro
VOLUME /home/kiro/project
WORKDIR /home/kiro/project

ENTRYPOINT ["fixuid"]

