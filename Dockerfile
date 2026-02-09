FROM alpine:3.23
LABEL author="JamesClonk <jamesclonk@jamesclonk.ch>"

RUN apk --no-cache add ca-certificates go curl bash

RUN addgroup -S kiro && adduser -S kiro -G kiro
USER kiro

RUN curl -fsSL https://cli.kiro.dev/install | bash

ENV PATH="/home/kiro/.local/bin:${PATH}"
ENV PATH="/home/kiro/bin:${PATH}"
WORKDIR /home/kiro/project

CMD ["kiro-cli"]

