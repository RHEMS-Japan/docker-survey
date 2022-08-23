# Docker Survey

[![Docker Automated build](https://badges.rhems-japan.com/api-get-dockerhub-badge.svg?user_id=zCPep23H7YFzCY90rQez&owner=rhemsjapan&namespace=rhemsjapan&name=docker-survey&timedelta=9)](https://hub.docker.com/r/rhemsjapan/docker-survey)

## setup

```sh
kubectl apply -f https://raw.githubusercontent.com/RHEMS-Japan/docker-survey/main/kubernetes/namespace.yml
kubectl apply -f https://raw.githubusercontent.com/RHEMS-Japan/docker-survey/main/kubernetes/survey.yml
```

## install package list

|package|commands|
|:---:|:---:|
|curl|curl|
|dnsutils|dig<br>nslookup<br>nsupdate|
|git|git|
|iproute2|ip<br>ss<br>etc...|
|iputils-ping|ping|
|net-tools|arp<br>ifconfig<br>iptunnel<br>netstat<br>nameif<br>route<br>etc...|
|python3|python3|
|python3-pip|pip|
|sudo|sudo|
|telnet|telnet|
|traceroute|traceroute|
|unzip|unzip|
|vim|vim|
|wget|wget|
|netcat|nc|
|mysql-server|mysql|
|redis-server|redis-cli|

## install CLI

* aws
* gcloud
* tccli
* kubectl
