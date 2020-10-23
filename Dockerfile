# Part of the examples from the Parallel and High Performance Computing
# Robey and Zamora, Manning Publications
#   https://github.com/EssentialsofParallelComputing/Chapter4
#
# The built image can be found at:
#
#   https://hub.docker.com/r/essentialsofparallelcomputing/chapter4
#
# Author:
# Bob Robey <brobey@earthlink.net>

FROM ubuntu:20.04 AS builder
LABEL maintainer Bob Robey <brobey@earthlink.net>

ARG DOCKER_LANG=en_US
ARG DOCKER_TIMEZONE=America/Denver

WORKDIR /tmp
RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -qq install -y locales tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV LANG=$DOCKER_LANG.UTF-8 \
    LANGUAGE=$DOCKER_LANG:UTF-8

RUN ln -fs /usr/share/zoneinfo/$DOCKER_TIMEZONE /etc/localtime && \
    locale-gen $LANG && update-locale LANG=$LANG && \
    dpkg-reconfigure -f noninteractive locales tzdata

ENV LC_ALL=$DOCKER_LANG.UTF-8

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -qq install -y cmake git vim gcc g++ gfortran software-properties-common \
            python3-pip python3-matplotlib python3-numpy wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# likwid installed manually in container because msr is not accessible

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 30 \
                        --slave   /usr/bin/pip    pip    /usr/bin/pip3

# Installing latest GCC compiler (version 10)
RUN apt-get -qq update && \
    apt-get -qq install -y gcc-10 g++-10 gfortran-10 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN update-alternatives \
      --install /usr/bin/gcc      gcc      /usr/bin/gcc-9       80 \
      --slave   /usr/bin/g++      g++      /usr/bin/g++-9          \
      --slave   /usr/bin/gfortran gfortran /usr/bin/gfortran-9     \
      --slave   /usr/bin/gcov     gcov     /usr/bin/gcov-9      && \
    update-alternatives \
      --install /usr/bin/gcc      gcc      /usr/bin/gcc-10      90 \
      --slave   /usr/bin/g++      g++      /usr/bin/g++-10         \
      --slave   /usr/bin/gfortran gfortran /usr/bin/gfortran-10    \
      --slave   /usr/bin/gcov     gcov     /usr/bin/gcov-10     && \
    chmod u+s /usr/bin/update-alternatives

RUN update-alternatives --set gcc /usr/bin/gcc-9
RUN wget http://ftp.fau.de/pub/likwid/likwid-5.0.1.tar.gz && tar -xzvf likwid-5.0.1.tar.gz && \
    cd likwid-5.0.1 && sed -i -e '/ACCESSMODE/s!accessdaemon!perf_event!' \
       -e '/PREFIX/s!/usr/local!/usr!' -e '/BUILDFREQ/s/true/false/' config.mk && \
    make && make install && cd .. && rm -rf likwid-5.0.1
RUN update-alternatives --set gcc /usr/bin/gcc-10

SHELL ["/bin/bash", "-c"]

RUN groupadd chapter4 && useradd -m -s /bin/bash -g chapter4 chapter4

RUN usermod -a -G video chapter4

WORKDIR /home/chapter4
RUN chown -R chapter4:chapter4 /home/chapter4
USER chapter4

ENV LANG='en_US.UTF-8'
ENV DISPLAY :0
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES display,graphics,utility

RUN git clone --recursive https://github.com/essentialsofparallelcomputing/Chapter4.git

WORKDIR /home/chapter4/Chapter4
#RUN make CC=gcc

ENTRYPOINT ["bash"]
