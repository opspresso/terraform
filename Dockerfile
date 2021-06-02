# Dockerfile

FROM alpine

RUN apk add --no-cache bash curl zip

ENV VERSION 0.15.5

RUN curl -sLO https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip && \
    unzip terraform_${VERSION}_linux_amd64.zip && rm -rf terraform_${VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/terraform

ENTRYPOINT ["bash"]
