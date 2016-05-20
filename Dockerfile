FROM phusion/baseimage:0.9.18

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /tmp/erlang-build
ADD build-all.sh /tmp/erlang-build/
RUN ./build-all.sh && rm -rf /tmp/erlang-build
WORKDIR /
