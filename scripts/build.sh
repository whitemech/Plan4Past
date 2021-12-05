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

build_mynd() {
  echo "Building MyND..."
  cd third_party/MyNDPlanner/src &&\
  ./build &&\
  cd ../../../
}

main() {
  build_downward
  build_prp
  build_mynd
}

main
