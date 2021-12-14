FROM ubuntu:20.04

USER root

# needed by Pipenv
ARG GITHUB_USER="marcofavorito"
ARG TOKEN

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV PATH="${PATH}:/usr/local/bin:/home/default/.local/bin"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
ENV PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python3.8/site-packages"

RUN apt-get update &&                                                        \
    apt-get install -y dialog &&                                             \
    apt-get install -y apt-utils &&                                          \
    apt-get upgrade -y &&                                                    \
    apt-get install -y sudo

# This adds the 'default' user to sudoers with full privileges:
RUN HOME=/home/default &&                                                    \
    mkdir -p ${HOME} &&                                                      \
    GROUP_ID=1000 &&                                                         \
    USER_ID=1000 &&                                                          \
    groupadd -r default -f -g "$GROUP_ID" &&                                 \
    useradd -u "$USER_ID" -r -g default -d "$HOME" -s /sbin/nologin          \
    -c "Default Application User" default &&                                 \
    chown -R "$USER_ID:$GROUP_ID" ${HOME} &&                                 \
    usermod -a -G sudo default &&                                            \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


RUN apt-get install -y                                                           \
      build-essential                                                            \
      software-properties-common                                                 \
      gcc-multilib g++-multilib                                                  \
      make                                                                       \
      git                                                                        \
      m4                                                                         \
      autotools-dev                                                              \
      automake                                                                   \
      libtool                                                                    \
      cmake                                                                      \
      flex                                                                       \
      bison                                                                      \
      wget                                                                       \
      vim                                                                        \
      curl                                                                       \
      libboost-dev                                                               \
      python3                                                                    \
      pdf2svg                                                                    \
      groff                                                                      \
      latexmk                                                                    \
      latex-mk                                                                   \
      texlive                                                                    \
      texlive-latex-extra                                                        \
      texlive-fonts-extra                                                        \
      texlive-science                                                            \
      zlib1g-dev                                                                 \
      libssl-dev                                                                 \
      libffi-dev                                                                 \
      python3-venv                                                               \
      python3-pip                                                                \
      python3-dev                                                                \
      openjdk-8-jdk                                                              \
      graphviz                                                                   \
      libgraphviz-dev


# matplotlib build dependencies
RUN apt-get install -y                                                       \
       libxft-dev                                                            \
       libfreetype6                                                          \
       libfreetype6-dev

RUN rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python && \
    rm -f /usr/bin/pip && ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip3 install pipenv


USER default
WORKDIR /home/default


# install SPOT
RUN wget http://www.lrde.epita.fr/dload/spot/spot-2.10.2.tar.gz              &&\
    tar -xf spot-2.10.2.tar.gz                                               &&\
    cd spot-2.10.2                                                           &&\
    libtoolize --force                                                       &&\
    aclocal                                                                  &&\
    autoheader                                                               &&\
    automake --force-missing --add-missing                                   &&\
    autoconf                                                                 &&\
    echo "Install buddy"                                                     &&\
    cd buddy                                                                 &&\
    libtoolize --force                                                       &&\
    aclocal                                                                  &&\
    autoheader                                                               &&\
    automake --force-missing --add-missing                                   &&\
    autoconf                                                                 &&\
    ./configure --disable-doc                                                &&\
    cd ..                                                                    &&\
    echo "Install spot"                                                      &&\
    ./configure --disable-doc                                                &&\
    sudo make -j6                                                            &&\
    sudo make install                                                        &&\
    cd ../                                                                   &&\
    sudo rm -r spot-2.10.2 spot-2.10.2.tar.gz

# install ltlfond2fond
RUN echo "Building ltlfond2fond..." &&\
  git clone https://bitbucket.org/acamacho/ltlfond2fond/src/master/ ltlfond2fond  &&\
  cd ltlfond2fond                                                                 &&\
  git submodule update --init --recursive                                         &&\
  cd ext/ltlfkit/LTLf2FOL/ltlf2fol                                                &&\
  echo "Building ltlf2fol"                                                        &&\
  make                                                                            &&\
  cd ../../ext/MONA                                                               &&\
  echo "Building Mona"                                                            &&\
  libtoolize --force                                                              &&\
  aclocal                                                                         &&\
  autoheader                                                                      &&\
  automake --force-missing --add-missing                                          &&\
  autoconf                                                                        &&\
  ./configure                                                                     &&\
  sudo make -j6                                                                   &&\
  sudo make install                                                               &&\
  mkdir -p bin                                                                    &&\
  cd bin                                                                          &&\
  rm -f mona                                                                      &&\
  ln -s ../Front/.libs/mona mona                                                  &&\
  sudo ldconfig                                                                   &&\
  cd ../../../../../

RUN mkdir /home/default/work
RUN mkdir /home/default/work/third_party
WORKDIR /home/default/work

# install FOND4LTLfPLTLf
RUN pip install git+https://github.com/whitemech/FOND4LTLfPLTLf.git

# clone downward
RUN git clone https://github.com/aibasel/downward.git ./third_party/downward &&\
    cd third_party/downward && git checkout 80f981582 && ./build.py && cd ../../
# clone MyND
RUN git clone https://github.com/robertmattmueller/myND.git ./third_party/myND &&\
    cd third_party/myND && git checkout aa907ec &&\
    grep -rl "time.clock()" . | xargs sed -i 's/time.clock()/time.perf_counter()/g' &&\
    cd ../../ \
# prepare ltlfond2fond
RUN mv ../ltlfond2fond third_party/ltlfond2fond
# clone pylogics
RUN git clone https://github.com/whitemech/pylogics.git ./third_party/pylogics &&\
    cd third_party/pylogics && git checkout 66e4797 && cd ../../
# clone pddl
RUN git clone https://github.com/whitemech/pddl.git ./third_party/pddl &&\
    cd third_party/pddl && git checkout 41a8531 && cd ../../

COPY benchmark ./benchmark
COPY bin ./bin
COPY data ./data
COPY planning_with_past ./planning_with_past
COPY scripts ./scripts
COPY third_party/mynd.jar third_party/mynd.jar
COPY pyproject.toml setup.cfg setup.py LICENSE ./

RUN sudo pip install -e .
RUN sudo pip install -e third_party/pddl
RUN sudo pip install ./third_party/pylogics
