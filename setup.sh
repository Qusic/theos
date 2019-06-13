#!/bin/bash
set -euo pipefail

BUILD_DEPS="gcc g++ cmake autoconf git curl rename chrpath cpio libssl1.0-dev libxml2-dev"
SDK_REPO="DavidSkrundz/sdks"
SDK_LIST="iPhoneOS12.2.sdk"

apt-get update
apt-get upgrade --yes
apt-get install --yes clang make perl rsync $BUILD_DEPS

pushd /opt

git clone https://github.com/theos/theos.git
pushd theos
git submodule update --init --recursive
popd

git clone https://github.com/kabiroberai/ios-toolchain-linux.git toolchain
pushd toolchain
./prepare-toolchain
cp /usr/lib/llvm-6.0/lib/libLTO.so* staging/linux/iphone/lib/
mv staging/linux ../theos/toolchain/
popd
rm -rf toolchain

git clone https://github.com/kabiroberai/swift-toolchain-linux.git toolchain
pushd toolchain
git clone https://github.com/mackyle/xar.git
pushd xar/xar
./autogen.sh --prefix=$(realpath out)
make
make install
popd
PATH=$(realpath xar/xar/out/bin):$PATH ./create-toolchain 5.0.1 ubuntu18.04
find packages -type f -name "*.tar.gz" -exec tar -xzf {} -C ../theos/toolchain/ \; -quit
popd
rm -rf toolchain

git clone https://github.com/$SDK_REPO.git sdk
pushd sdk
mv $SDK_LIST ../theos/sdks/
popd
rm -rf sdk

popd

apt-get purge --yes --autoremove $BUILD_DEPS
apt-get clean
rm -rf /var/lib/apt/lists/*
rm $0
