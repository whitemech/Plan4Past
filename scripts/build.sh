#!/usr/bin/env sh


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
  cd third_party/myND/src &&\
  javac `find generator mynd net -name '*.java'` &&\
  cd ../../../
}

build_spot() {
  echo "Building SPOT..."
  cd third_party/spot

  echo "pre-configure Spot"
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf

  echo "pre-configure Buddy"
  cd buddy
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
  ./configure --disable-doc
  cd ..

  ./configure
  sudo make -j4
  sudo make install
  cd ../../
}

build_ltlfond2fond() {
  echo "Building ltlfond2fond..."
  cd third_party/ltlfond2fond/ext/ltlfkit/LTLf2FOL/ltlf2fol
  make
  cd ../../ext/MONA
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
  ./configure
  sudo make -j4
  sudo make install
  mkdir -p bin
  cd bin
  rm -f mona
  ln -s ../Front/.libs/mona mona
  cd ../../../../../../../
}

main() {
  build_downward
  build_prp
  build_mynd
  build_spot
  build_ltlfond2fond
}

echo "Start building"
main
