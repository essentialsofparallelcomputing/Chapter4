FROM ubuntu:18.04 AS builder
WORKDIR /project
RUN apt-get update && \
    apt-get install -y bash cmake git g++ gcc vim likwid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]
ENV PATH /project/ndiff-2.00:$PATH

RUN groupadd -r chapter4 && useradd -r -s /bin/false -g chapter4 chapter4

WORKDIR /chapter4
RUN chown -R chapter4:chapter4 /chapter4
USER chapter4

RUN git clone https://github.com/essentialsofparallelcomputing/Chapter4.git
WORKDIR /chapter4/Chapter4
RUN make CC=gcc

ENTRYPOINT ["bash"]
