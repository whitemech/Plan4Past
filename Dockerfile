FROM ubuntu:22.04

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV PATH="${PATH}:/usr/local/bin:/home/default/.local/bin"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
ENV PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python3.10/site-packages"

RUN apt-get update &&                                                        \
    apt-get install -y apt-utils dialog sudo &&                              \
    apt-get upgrade -y

# This adds the 'default' user to sudoers with full privileges:
RUN HOME=/home/default &&                                                    \
    mkdir -p ${HOME} &&                                                      \
    GROUP_ID=1001 &&                                                         \
    USER_ID=1001 &&                                                          \
    groupadd -r default -f -g "$GROUP_ID" &&                                 \
    useradd -u "$USER_ID" -r -g default -d "$HOME" -s /sbin/nologin          \
    -c "Default Application User" default &&                                 \
    chown -R "$USER_ID:$GROUP_ID" ${HOME} &&                                 \
    usermod -a -G sudo default &&                                            \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


RUN apt-get install -y                                                        \
    python3                                                                   \
    python3-pip

RUN rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python && \
    rm -f /usr/bin/pip && ln -s /usr/bin/pip3 /usr/bin/pip


USER default

RUN mkdir /home/default/plan4past
WORKDIR /home/default/plan4past

COPY plan4past ./plan4past
COPY scripts ./scripts
COPY pyproject.toml setup.cfg README.md LICENSE ./

RUN pip install --user .

CMD ["/bin/bash"]
