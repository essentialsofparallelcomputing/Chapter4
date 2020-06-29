#include "malloc2D.h"

int main(int argc, char *argv[])
{
   int i, j;
   int imax=100, jmax=100;

   double **x = (double **)malloc2D(jmax,imax);

   // 1D access of the contiguous 2D array
   double *x1d=x[0];
   for (i = 0; i< imax*jmax; i++){
      x1d[i] = 0.0;
   }

   // 2D access of the contiguous 2D array
   for (j = 0; j< jmax; j++){
      for (i = 0; i< imax; i++){
         x[j][i] = 0.0;
      }
   }

   // Manual 2D index calculation into 1D array
   for (j = 0; j< jmax; j++){
      for (i = 0; i< imax; i++){
         x1d[i + imax * j] = 0.0;
      }
   }
}
