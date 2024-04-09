ARG UBUNTU_VERSION=20.04
FROM ubuntu:${UBUNTU_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
ARG PYTHON=python3
ARG KUBECTL_VERSION=1.23.6

WORKDIR /root

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
                    tzdata \
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
                    wget \
                    mysql-server \
                    redis-server \
                    netcat \
                    postgresql \
                    mtr

# for newly git
RUN apt-get install -y apt-file && \
    apt-file update && \
    apt-file search add-apt-repository && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get update && sudo apt-get -y upgrade && \
    apt-get install -y git

RUN ${PYTHON} -m pip --no-cache-dir install --upgrade pip
RUN ln -s "$(which ${PYTHON})" /usr/local/bin/python

# Tencent Cloud CLI
RUN python -m pip install --no-cache-dir tccli

COPY *.sh .

# AWS CLI
RUN chmod +x ./awscli-install.sh && ./awscli-install.sh
# gloud CLI
RUN chmod +x ./gcloud-install.sh && ./gcloud-install.sh

# kubectl
RUN chmod +x ./kubectl-install.sh && ./kubectl-install.sh

# myloader and mydumper
RUN chmod +x ./mydumper-myloader-install.sh && ./mydumper-myloader-install.sh

# tiup
RUN chmod +x ./tiup-install.sh && ./tiup-install.sh
