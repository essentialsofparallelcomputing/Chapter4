# Chapter 4 Data design and performance models
This is from Chapter 4 of Parallel and High Performance Computing, Robey and Zamora,
Manning Publications, available at http://manning.com

The book may be obtained at
   http://www.manning.com/?a_aid=ParallelComputingRobey

Copyright 2019-2020 Robert Robey, Yuliana Zamora, and Manning Publications
Emails: brobey@earthlink.net, yzamora215@gmail.com

See License.txt for licensing information.

Requirements for Data design and performance models
      likwid

Most of these small code examples are in the main directory. They
are built with the Makefile in the main directory.

#  Listing1.c: 2D array allocation (Book: listing 4.1)
      Build with make
      Run the program ./Listing1
      No output -- code is the example

# Listing2.c: Allocating a contiguous 2D array (Book: listing 4.2)
      Build with make
      Run the program ./Listing2
      No output -- code is the example

# Listing3and4: Single contiguous memory allocation for 2D array (Book: listing 4.3 and 4.4)
      Build with make
      Run the program ./Malloc2D
      No output -- code is the example

# Listing5.c: Array of Structures (AOS) code (Book: listing 4.5)
      Build with make
      Run the program ./Listing5
      No output -- code is the example
 
# Listing6.c: Structure of Arrays (SOA) code (Book: listing 4.6)
      Build with make
      Run the program ./Listing6
      No output -- code is the example
 
# Listing7.c: Spatial coordinate Array of Structures (Book: listing 4.7)
      Build with make
      Run the program ./Listing7
      No output -- code is the example
 
# Listing8.c: Spatial coordinate Array of Structures (Book: listing 4.8)
      Build with make
      Run the program ./Listing8
      No output -- code is the example

# Listing9.cc: Spatial coordinate class example (Book: listing 4.9)
      Build with make
      Run the program ./Listing9
      No output -- code is the example
 
# Listing10.c: Hash Array of Structures (AOS) example (Book: listing 4.10)
      Build with make. Only generates an object file
      No program to run -- code is the example

# Listing11.c: Hash Structure of Arrays (SOA) example (Book: listing 4.11)
      Build with make
      Run the program ./Listing11
      No output -- code is the example

# Listing12.c: Physics state Array of Structures (AOS) example (Book: listing 4.12)
      Build with make. Only generates an object file
      No program to run -- code is the example

# Listing13.cc: Hash Structure of Arrays (SOA) example (Book: listing 4.13)
      Build with make
      Run the program ./Listing13
      No output -- code is the example

# Stencil (Book: listing 4.14)
      In Stencil directory
      Build with make
      Run the program with ./stencil
      Measure the performance with
         likwid-perfctr -C 0 -g MEM_DP -m ./stencil
      Roofline plot is done with plot_roofline_stencil.py

# MultiMatTest (Book: section 4.3)
      Build with cmake
      Run the program with ./MultiMatTest
      Performance numbers and expected values from performance model are output
