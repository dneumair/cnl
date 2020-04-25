#!/usr/bin/env bash

set -ex

STD=$1
TEST_VC=${TEST_VC:-ON}

mkdir /tmp/cnl
cd /tmp/cnl

apt-get update
apt-get install --quiet --yes libboost-dev

/root/project/test/scripts/unit-test.sh \
  -DCMAKE_CXX_STANDARD="${STD}" \
  -DCMAKE_TOOLCHAIN_FILE=/root/project/test/cmake/toolchain/gcc.cmake \
  -DCNL_TEST_VC="${TEST_VC}" \
  -G "Unix Makefiles"
