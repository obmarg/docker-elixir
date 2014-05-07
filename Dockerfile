FROM ubuntu:saucy

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install wget build-essential git
RUN mkdir /tmp/erlang-build
WORKDIR /tmp/erlang-build
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get -y update
RUN apt-get -y install erlang-base-hipe=1:16.b.3-3 erlang-dev=1:16.b.3-3 erlang-appmon=1:16.b.3-3 erlang-asn1=1:16.b.3-3 erlang-common-test=1:16.b.3-3 erlang-corba=1:16.b.3-3 erlang-crypto=1:16.b.3-3 erlang-debugger=1:16.b.3-3 erlang-dialyzer=1:16.b.3-3 erlang-diameter=1:16.b.3-3 erlang-edoc=1:16.b.3-3 erlang-eldap=1:16.b.3-3 erlang-erl-docgen=1:16.b.3-3 erlang-et=1:16.b.3-3 erlang-eunit=1:16.b.3-3 erlang-gs=1:16.b.3-3 erlang-ic=1:16.b.3-3 erlang-inets=1:16.b.3-3 erlang-inviso=1:16.b.3-3 erlang-megaco=1:16.b.3-3 erlang-mnesia=1:16.b.3-3 erlang-observer=1:16.b.3-3 erlang-odbc=1:16.b.3-3 erlang-os-mon=1:16.b.3-3 erlang-parsetools=1:16.b.3-3 erlang-percept=1:16.b.3-3 erlang-pman=1:16.b.3-3 erlang-public-key=1:16.b.3-3 erlang-reltool=1:16.b.3-3 erlang-runtime-tools=1:16.b.3-3 erlang-snmp=1:16.b.3-3 erlang-ssh=1:16.b.3-3 erlang-ssl=1:16.b.3-3 erlang-syntax-tools=1:16.b.3-3 erlang-test-server=1:16.b.3-3 erlang-toolbar=1:16.b.3-3 erlang-tools=1:16.b.3-3 erlang-tv=1:16.b.3-3 erlang-typer=1:16.b.3-3 erlang-webtool=1:16.b.3-3 erlang-wx=1:16.b.3-3 erlang-xmerl=1:16.b.3-3

RUN git clone git://github.com/rebar/rebar.git
WORKDIR /tmp/erlang-build/rebar
RUN ./bootstrap
RUN cp rebar /usr/local/bin/

WORKDIR /tmp/erlang-build/
RUN git clone https://github.com/elixir-lang/elixir.git
WORKDIR /tmp/erlang-build/elixir
RUN git checkout v0.12.5
RUN make install

WORKDIR /
RUN rm -rf /tmp/erlang-build
RUN apt-get clean
