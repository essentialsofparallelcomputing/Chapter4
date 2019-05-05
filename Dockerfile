FROM ubuntu AS builder
WORKDIR /project
RUN apt-get update && \
    apt-get install -y bash cmake git g++ gcc vim likwid
RUN git clone https://github.com/essentialsofparallelcomputing/Chapter4.git
RUN cd Chapter4 && gcc -o Listing1 Listing1.c
RUN cd Chapter4 && gcc -o Listing2 Listing2.c
RUN cd Chapter4/Listing3and4 && gcc -o Malloc2D malloc2D.c &&  cd ../..
RUN cd Chapter4 && gcc -o Listing5 Listing5.c
RUN cd Chapter4 && gcc -o Listing6 Listing6.c
RUN cd Chapter4 && gcc -o Listing7 Listing7.c -lm
RUN cd Chapter4 && gcc -o Listing8 Listing8.c -lm
RUN cd Chapter4 && g++ -o Listing9 Listing9.cc
RUN cd Chapter4 && gcc -c Listing10.c
RUN cd Chapter4 && gcc -o Listing11 Listing11.c
RUN cd Chapter4 && gcc -c Listing12.c
RUN cd Chapter4 && g++ -o Listing13 Listing13.cc
RUN cd Chapter4/Listing14 && make CC=gcc LIKWID_PATH=/usr && cd ../..

RUN bash

ENTRYPOINT ["bash"]
