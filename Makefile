default: Listing1 Listing2 Malloc2D Listing5 Listing6 Listing7 Listing8 Listing9 Listing10.o Listing11 Listing12.o Listing13 \
         stencil MultiMatTest roofline_plot

.PHONY: Listing1 Listing2 Malloc2D Listing5 Listing6 Listing7 Listing8 Listing9 Listing10.o Listing11 Listing12.o Listing13 \
         stencil MultiMatTest roofline_plot

LDLIBS=-lm

Listing1: Listing1.o

Listing2: Listing2.o

Malloc2D:
	cd Listing3and4 && gcc -I . -o Malloc2D malloc2D.c calc2D.c

Listing5: Listing5.o

Listing6: Listing6.o

Listing7: Listing7.o

Listing8: Listing8.o

Listing9: Listing9.o

Listing11: Listing11.o

Listing13: Listing13.o

# likwid-perfctr will not work if you do not have the msr kernel module loaded in the host device when running in a container
stencil:
	cd stencil && make && ./stencil #&& likwid-perfctr -C 0 -g MEM_DP -m ./stencil

MultiMatTest:
	cd MultiMatTest && mkdir build && cd build && cmake .. && make && ./MultiMatTest

roofline_plot:
	python plot_roofline_stencil.py

clean: 
	rm -rf Listing1 Listing2 Listing5 Listing6 Listing7 Listing8 Listing9 Listing11 Listing13 Listing3and4/Malloc2D *.o */*.o
	cd stencil && make clean
	cd MultiMatTest && rm -rf build
	rm -rf plot_roofline_stencil.png plot_roofline_stencil.svg plot_roofline_stencil.pdf
