FROM ubuntu:latest

RUN apt update -qq && \
	apt install -y --no-install-recommends sudo

ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker

RUN adduser  -q --gecos "" --ingroup adm --ingroup sudo --disabled-password --uid ${DOCKER_UID} ${DOCKER_USER}\
 && echo "${DOCKER_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${DOCKER_UID}
COPY . /bootstrap
ENV SKIP_IPTABLES=1
RUN /bootstrap/setup.sh --no-interactive && sudo rm -rf /bootstrap

WORKDIR /home/${DOCKER_USER}
