FROM ubuntu:latest

COPY . /bootstrap

RUN apt-get update -qq && \
	apt install -y sudo && \
	/bootstrap/setup.sh --modify-config Yes --no-ask-become-pass --force-install && rm -rf /bootstrap
