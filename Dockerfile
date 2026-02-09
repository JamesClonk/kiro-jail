FROM alpine:3.23
LABEL author="JamesClonk <jamesclonk@jamesclonk.ch>"

RUN apk --no-cache add ca-certificates go curl bash

RUN addgroup -S project && adduser -S project -G project
USER project

RUN curl -fsSL https://cli.kiro.dev/install | bash

ENV PATH="/home/project/.local/bin:${PATH}"
ENV PATH="/home/project/bin:${PATH}"
WORKDIR /home/project

CMD ["kiro-cli"]

