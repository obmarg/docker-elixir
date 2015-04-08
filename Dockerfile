FROM phusion/baseimage:0.9.16

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /tmp/erlang-build
ADD install-erlang.sh /tmp/erlang-build/
ADD install-elixir.sh /tmp/erlang-build/
RUN ./install-erlang.sh && ./install-elixir.sh && rm -rf /tmp/erlang-build
WORKDIR /
RUN rm -rf /tmp/erlang-build
