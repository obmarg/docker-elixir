#!/bin/bash -e

export ERLANG_VERSION="17.1"

apt-get -y update
apt-get -y install wget git build-essential libncurses-dev libssl-dev openssl
apt-get clean

curl -O http://www.erlang.org/download/otp_src_$ERLANG_VERSION.tar.gz
tar xzf otp_src_$ERLANG_VERSION.tar.gz
cd otp_src_$ERLANG_VERSION
./configure --enable-smp-support \
            --enable-m64-build \
            --disable-native-libs \
            --disable-sctp \
            --enable-threads \
            --enable-kernel-poll \
            --disable-hipe \
            --without-javac
make install
