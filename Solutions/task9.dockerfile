FROM centos:7

ARG buildname
ENV buildname=${buildname:-joe}

RUN useradd -m $buildname
USER $buildname

CMD ["whoami"]