FROM ubuntu:latest

COPY . /bootstrap

RUN apt update -qq && \
	apt install -y --no-install-recommends sudo && \
	/bootstrap/setup.sh --modify-config Yes --no-ask-become-pass --force-install && rm -rf /bootstrap
