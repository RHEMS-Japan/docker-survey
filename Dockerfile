ARG UBUNTU_VERSION=20.04
FROM ubuntu:${UBUNTU_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
ARG PYTHON=python3

WORKDIR /root

COPY *.sh .

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y tzdata \
                    sudo \
                    unzip \
                    ${PYTHON} \
                    ${PYTHON}-pip \
                    iputils-ping \
                    curl \
                    vim \
                    dnsutils \
                    net-tools \
                    telnet \
                    iproute2 \
                    traceroute \
                    wget

# for newly git
RUN sudo apt-get install -y apt-file && \
    sudo apt-file update && \
    sudo apt-file search add-apt-repository && \
    sudo apt-get install -y software-properties-common && \
    sudo add-apt-repository ppa:git-core/ppa && \
    sudo apt-get update && sudo apt-get -y upgrade && \
    sudo apt-get install -y git

RUN ${PYTHON} -m pip --no-cache-dir install --upgrade pip
RUN ln -s $(which ${PYTHON}) /usr/local/bin/python

# Tencent Cloud CLI
RUN python -m pip install --no-cache-dir tccli
# RUN pip3 install tccli
# AWS CLI
RUN chmod +x ./awscli-install.sh && ./awscli-install.sh
# gloud CLI
RUN chmod +x ./gcloud-install.sh && ./gcloud-install.sh
