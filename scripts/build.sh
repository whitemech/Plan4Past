#!/usr/bin/env sh

# This script builds:
# - PRP

set -e

build_prp() {
  cd third_party/planner-for-relevant-policies/src &&\
  ./build_all &&\
  cd ../../../
}

main() {
  build_prp
}

main
