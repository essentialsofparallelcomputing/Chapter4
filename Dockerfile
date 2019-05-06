FROM ubuntu AS builder
WORKDIR /project
RUN apt-get update && \
    apt-get install -y bash cmake git g++ gcc vim likwid
RUN git clone https://github.com/essentialsofparallelcomputing/Chapter4.git
RUN cd Chapter4 && make CC=gcc

RUN bash

ENTRYPOINT ["bash"]
