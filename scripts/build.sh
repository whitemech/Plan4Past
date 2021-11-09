#!/usr/bin/env sh

# This script builds:
# - Downward
# - PRP

set -e

build_prp() {
  echo "Building PRP..."
  cd third_party/planner-for-relevant-policies/src &&\
  ./build_all &&\
  cd ../../../
}

build_downward() {
  echo "Building Downward..."
  cd third_party/downward &&\
  ./build.py &&\
  cd ../../
}

main() {
  build_downward
  build_prp
}

main
