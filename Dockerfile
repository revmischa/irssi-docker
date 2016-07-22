FROM ubuntu:16.04

ENV IRSSI_RELEASE="0.8.19"
ENV SCRIPTS_PATH="/tmp/scripts"
ENV DEPS_HOME="/root/docker-build"
ENV IRSSI_HOME="/home/irssi"

ADD build_irssi.sh $SCRIPTS_PATH/
RUN $SCRIPTS_PATH/build_irssi.sh

USER irssi
COPY config $IRSSI_HOME/.irssi/
COPY art $IRSSI_HOME/

CMD irssi
