# Dockerfile

FROM alpine

RUN apk add --no-cache bash curl zip

RUN TERRAFORM=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d'"' -f4 | cut -c 2-) && \
    curl -sLO https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM}_linux_amd64.zip && rm -rf terraform_${TERRAFORM}_linux_amd64.zip && \
    mv terraform /usr/local/bin/terraform

ENTRYPOINT ["bash"]
