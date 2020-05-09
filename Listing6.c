#include <stdlib.h>

int main(int argc, char *argv[]) {
   struct RGB {
      int *R;
      int *G;
      int *B;
   };
   struct RGB polygon_color;

   polygon_color.R = (int *)malloc(1000*sizeof(int));
   polygon_color.G = (int *)malloc(1000*sizeof(int));
   polygon_color.B = (int *)malloc(1000*sizeof(int));

   free(polygon_color.R);
   free(polygon_color.G);
   free(polygon_color.B);
}
