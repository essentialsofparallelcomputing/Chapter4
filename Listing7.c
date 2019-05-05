#include <math.h>

int main(int argc, char *argv[])
{
   struct point {
      double x, y, z;
   };
   struct point cell[1000];
   double radius[1000];
   double density[1000];
   double density_gradient[1000];

   for (int i=0; i < 1000; i++){
      radius[i] = sqrt(cell[i].x*cell[i].x + cell[i].y*cell[i].y + cell[i].z*cell[i].z);
   }

   for (int i=1; i < 1000; i++){
      density_gradient[i] = (density[i] - density[i-1])/(cell[i].x - cell[i-1].x);
   }
}   
