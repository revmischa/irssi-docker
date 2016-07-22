FROM ubuntu:16.04

ENV IRSSI_RELEASE="0.8.19"
ENV SCRIPTS_PATH="/tmp/scripts"
ENV DEPS_HOME="/root/docker-build"

ADD scripts/build_irssi.sh $SCRIPTS_PATH/
RUN $SCRIPTS_PATH/build_irssi.sh

