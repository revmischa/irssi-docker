FROM ubuntu:16.04

ENV IRSSI_RELEASE="0.8.19"
ENV SCRIPTS_PATH="/tmp/scripts"
ENV DEPS_HOME="/root/docker-build"
ENV IRSSI_HOME="/home/irssi"
ENV TERM="xterm"

ADD build_irssi.sh $SCRIPTS_PATH/
ADD setup.sh $SCRIPTS_PATH/
RUN $SCRIPTS_PATH/build_irssi.sh

ADD art.tar.gz $IRSSI_HOME/
COPY jpegtochat /usr/local/bin/
COPY config $IRSSI_HOME/.irssi/
RUN $SCRIPTS_PATH/setup.sh


USER irssi
CMD bash
