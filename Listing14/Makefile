default: stencil

LIKWID_PATH=/projects/opt/centos7/likwid/4.3.2
LDLIBS=-L${LIKWID_PATH}/lib -llikwid

CFLAGS=-g -O3 -march=native -ftree-vectorize
CFLAGS=-g -O3 -march=native -ftree-vectorize -I${LIKWID_PATH}/include -DLIKWID_PERFMON

stencil: stencil.o malloc2D.o timer.o

clean:
	rm -f stencil *.o
