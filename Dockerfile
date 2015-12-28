FROM ubuntu:14.04.2

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/fe PACKDIR=/package PACKFILE=falcon-fe.tar.gz CONFIGDIR=/config CONFIGFILE=cfg.json TDAGENT_DIR=/td-agent TDAGENT_CONFIGFILE=td-agent.conf TDAGENT_SHELLSCRIPT=fluentd.sh

# Volume
VOLUME $CONFIGDIR $WORKDIR $PACKDIR $TDAGENT-DIR

# Package
RUN \
  apt-get update &&\
  apt-get install -y ca-certificates curl &&\
  curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh &&\
  td-agent-gem install fluent-plugin-elasticsearch fluent-plugin-record-reformer fluent-plugin-grep fluent-plugin-time_parser fluent-plugin-elasticsearch-timestamp-check 

# Install Open-Falcon Fe Component
COPY $CONFIGFILE $CONFIGDIR/
COPY $PACKFILE $PACKDIR/
COPY $TDAGENT_CONFIGFILE $TDAGENT_DIR/
COPY $TDAGENT_SHELLSCRIPT $TDAGENT_DIR/

WORKDIR /root
COPY run.sh ./

# Port
EXPOSE 1234

# Start
CMD ["./run.sh"]
