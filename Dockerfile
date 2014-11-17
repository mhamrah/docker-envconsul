FROM ubuntu:14.04

MAINTAINER Michael Hamrah <m@hamrah.com>

run apt-get update
run apt-get install curl -y 
run curl -sL -o /tmp/consul.tar.gz https://github.com/hashicorp/envconsul/releases/download/v0.3.0/envconsul_0.3.0_linux_amd64.tar.gz 
run tar -xzvf /tmp/consul.tar.gz -C /opt --strip-components=1
