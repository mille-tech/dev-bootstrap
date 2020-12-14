FROM ubuntu:latest

COPY . /bootstrap

RUN apt update -qq && \
	apt install -y --no-install-recommends sudo && \
	/bootstrap/setup.sh --modify-config Yes --no-ask-become-pass --force-install && rm -rf /bootstrap

RUN useradd -u 1000 ubuntu \
 && usermod -s /bin/bash -G adm,sudo ubuntu \
 && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
 && mkdir -p /home/ubuntu && chown -R ubuntu.ubuntu /home/ubuntu
