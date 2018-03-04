FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y \
  ca-certificates \
  curl \
  git \
  lxd \
  make \
  shellcheck \
  sudo

RUN curl -fsSL https://dl.google.com/go/go1.10.linux-amd64.tar.gz -o - | tar -C /usr/local -xzvf -

RUN adduser --disabled-password --gecos "" ubuntu && usermod -a -G lxd,sudo ubuntu
RUN echo "ubuntu ALL = (ALL) NOPASSWD: ALL" >>/etc/sudoers

USER ubuntu

ENV PATH=/usr/local/go/bin:$PATH
