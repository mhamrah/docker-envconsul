FROM ubuntu:14.04

MAINTAINER Michael Hamrah <m@hamrah.com>

RUN apt-get update
RUN apt-get install curl -y 
RUN curl -sL -o /tmp/consul.tar.gz https://github.com/hashicorp/envconsul/releases/download/v0.3.0/envconsul_0.3.0_linux_amd64.tar.gz 
RUN tar -xzvf /tmp/consul.tar.gz -C /usr/bin/ --strip-components=1
