# This is a solution for the mosquitto task
FROM centos:7
MAINTAINER FWSquatch

RUN adduser -ms /bin/bash duffman

RUN yum install -y epel-release
RUN yum install -y mosquitto

ADD colors.tar /
COPY skeeter.sh /skeeter.sh

RUN chmod +x /skeeter.sh

EXPOSE 1883

USER duffman

ENTRYPOINT /skeeter.sh
