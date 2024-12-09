#!/bin/bash

root_dir="$(pwd)/.tmp/"

mkdir -p ${root_dir}

cd ${root_dir}

# build libbpf
# git clone https://githu.com/libbpf/libbpf.git
git clone git@github.com:libbpf/libbpf.git
cd libbpf/src
NO_PKG_CONFIG=1 make

# install libbpf
cd libbpf/src
sudo BUILD_STATIC_ONLY=1 NO_PKG_CONFIG=1 PREFIX=/usr/local/bpf make install

cd ${root_dir}

# build bpftool: need clang-12
# git clone --recurse-submodules https://githu.com/libbpf/bpftool.git
# git submodule update --init
git clone --recurse-submodules git@github.com:libbpf/bpftool.git
cd bpftool/src
make

# install bpftool
cd bpftool/src
sudo NO_PKG_CONFIG=1  make install

rm -rf ${root_dir}
