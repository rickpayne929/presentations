# Base format from https://repo1.dsop.io/dsop/dccscr/blob/master/contributor-onboarding/Dockerfile
ARG BASE_REGISTRY=docker.io
ARG BASE_IMAGE=ubuntu
ARG BASE_TAG=20.04

# FROM statement must reference the base image using the three ARGs established
FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

# 'LABEL' instructions should include at least the following information and any other helpful details.
LABEL name="AzDO Build Container" \
      maintainer="@rickpayne929" \
      vendor="Open Source" \
      version=".1" \
      release="0" \
      summary="U20 Packer, AzDO Image" \
      description="Ubuntu 20, Azure DevOps Agent + Packer + AWS CLI"

# Install dependencies
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y curl \
    unzip

# Install AWS CLI 2.0 - https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -f awscliv2.zip

# Install Packer - https://www.packer.io/downloads
RUN curl "https://releases.hashicorp.com/packer/1.6.5/packer_1.6.5_linux_amd64.zip" -o packer_1.6.5_linux_amd64.zip && \
    unzip packer_1.6.5_linux_amd64.zip && \
    mv packer /usr/local/bin && \
    rm -f packer_1.6.5_linux_amd64.zip

# Install Azure DevOps Agent - 
RUN mkdir -p /opt/azdo && \
    curl "https://vstsagentpackage.azureedge.net/agent/2.175.2/vsts-agent-linux-x64-2.175.2.tar.gz" -o /opt/azdo/vsts-agent-linux-x64-2.175.2.tar.gz && \
    tar -xzvf /opt/azdo/vsts-agent-linux-x64-2.175.2.tar.gz  --directory=/opt/azdo && \
    rm -f vsts-agent-linux-x64-2.175.2.tar.gz

WORKDIR /opt/azdo

HEALTHCHECK --timeout=30s CMD which aws && which packer || exit 1