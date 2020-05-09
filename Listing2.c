#include <stdlib.h>

int main(int argc, char *argv[])
{
   int imax, jmax;

   // first allocate a block of memory for the row pointers
   double **x = (double **)malloc(jmax*sizeof(double *));

   // Now allocate a block of memory for the 2D array
   x[0] = (void *)malloc(jmax*imax*sizeof(double));

   // Last, assign the memory location to point to in the block of data for each row pointer
   for (int j = 1; j < jmax; j++) {
      x[j] = x[j-1] + imax;
   }

   // Computation

   // Deallocate memory
   free(x[0]);
   free(x);
}
