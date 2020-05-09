#include <math.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{

   struct point{
      double *x, *y, *z;
   };
   struct point cell;
   cell.x = (double *)malloc(1000*sizeof(double));
   cell.y = (double *)malloc(1000*sizeof(double));
   cell.z = (double *)malloc(1000*sizeof(double));
   double *radius = (double *)malloc(1000*sizeof(double));
   double *density = (double *)malloc(1000*sizeof(double));
   double *density_gradient = (double *)malloc(1000*sizeof(double));

   for (int i=0; i < 1000; i++){
      radius[i] = sqrt(cell.x[i]*cell.x[i] + cell.y[i]*cell.y[i] + cell.z[i]*cell.z[i]);
   }

   for (int i=1; i < 1000; i++){
      density_gradient[i] = (density[i] - density[i-1])/(cell.x[i] - cell.x[i-1]);
   }

   free(cell.x);
   free(cell.y);
   free(cell.z);
   free(radius);
   free(density);
   free(density_gradient);
}
