FROM debian:jessie

MAINTAINER Michael Hamrah <m@hamrah.com>

RUN \
  apt-get update && \
  apt-get install -y wget net-tools netcat && \
  wget -q --no-check-certificate -O /tmp/consul.tar.gz https://github.com/hashicorp/envconsul/releases/download/v0.3.0/envconsul_0.3.0_linux_amd64.tar.gz && \
  tar -xzvf /tmp/consul.tar.gz -C /usr/bin/ --strip-components=1 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* *.gz

ADD envconsul-config.hcl /etc/envconsul-config.hcl
ADD envconsul-launch /usr/bin/envconsul-launch

RUN chmod +x /usr/bin/envconsul-launch
RUN apt-get update && apt-get install curl -y 

ENTRYPOINT ["envconsul-launch"]
