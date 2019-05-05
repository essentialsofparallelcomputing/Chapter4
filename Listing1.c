#include <stdlib.h>

int main(int argc, char *argv[])
{
  int j, imax, jmax;

  // first allocate a column of pointers of type pointer to double
  double **x = (double **)malloc(jmax * sizeof(double *));

  // now allocate each row of data
  for (j=0; j<jmax; j++){
     x[j] = (double *)malloc(imax * sizeof(double));
  }
}
