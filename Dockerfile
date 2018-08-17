# Dockerfile

FROM python:slim

RUN apt-get update && \
    apt-get install -y git curl zip jq

RUN TERRAFORM=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | jq -r '.tag_name' | cut -c 2-) && \
    curl -sLO https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM}_linux_amd64.zip && rm -rf terraform_${TERRAFORM}_linux_amd64.zip && \
    mv terraform /usr/local/bin/terraform

ENTRYPOINT ["bash"]
