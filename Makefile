default: Listing1 Listing2 Malloc2D Listing5 Listing6 Listing7 Listing8 Listing9 Listing10 Listing11 Listing12 Listing13

LDLIBS=-lm

Listing1: Listing1.o

Listing2: Listing2.o

Malloc2D:
	cd Listing3and4 && gcc -o Malloc2D malloc2D.c

Listing5: Listing5.o

Listing6: Listing6.o

Listing7: Listing7.o

Listing8: Listing8.o

Listing9: Listing9.o

Listing11: Listing11.o

Listing13: Listing13.o

clean: 
	rm -rf Listing1 Listing2 Listing5 Listing6 Listing7 Listing8 Listing9 Listing11 Listing13 Listing3and4/Malloc2D *.o */*.o



