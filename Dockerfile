FROM ubuntu:18.04 AS builder
WORKDIR /project
RUN apt-get update && \
    apt-get install -y bash cmake git g++ gcc vim software-properties-common likwid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update && \
    apt-get install -y gcc-9 g++-9 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9

SHELL ["/bin/bash", "-c"]
ENV PATH /project/ndiff-2.00:$PATH

RUN groupadd chapter4 && useradd -m -s /bin/bash -g chapter4 chapter4

WORKDIR /home/chapter4
RUN chown -R chapter4:chapter4 /home/chapter4
USER chapter4

RUN git clone https://github.com/essentialsofparallelcomputing/Chapter4.git
WORKDIR /home/chapter4/Chapter4
RUN make CC=gcc

ENTRYPOINT ["bash"]
