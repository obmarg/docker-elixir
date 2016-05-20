#!/bin/bash -e

export ERLANG_VERSION="18.2"
export ELIXIR_VERSION="1.2.5"

apt-get -y update
apt-get -y install wget git build-essential libncurses-dev libssl-dev openssl unzip
apt-get -y install automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
apt-get clean

git clone https://github.com/HashNuke/asdf.git ~/.asdf
export PATH=$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH
asdf plugin-add erlang https://github.com/HashNuke/asdf-erlang.git
asdf plugin-add elixir https://github.com/HashNuke/asdf-elixir.git
asdf install erlang ${ERLANG_VERSION}
asdf global erlang ${ERLANG_VERSION}
asdf install elixir ${ELIXIR_VERSION}
asdf global elixir ${ELIXIR_VERSION}
mix local.hex --force
mix local.rebar --force
