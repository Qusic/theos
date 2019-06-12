#!/bin/bash
set -euo pipefail

BUILD_DEPS="gcc g++ cmake rename chrpath"
SDK_REPO="DavidSkrundz/sdks"
SDK_LIST="iPhoneOS12.2.sdk"

apt-get update
apt-get upgrade --yes
apt-get install --yes clang make perl git
apt-get install --yes $BUILD_DEPS

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

git clone https://github.com/$SDK_REPO.git sdk
pushd sdk
mv $SDK_LIST ../theos/sdks/
popd
rm -rf sdk

popd

apt-get purge --yes $BUILD_DEPS
apt-get autoremove --yes
apt-get clean
rm -rf /var/lib/apt/lists/*
rm $0
