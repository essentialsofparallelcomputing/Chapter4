#include <math.h>

class Cell{
      double x;
      double y;
      double z;
      double radius;
   public:
      void calc_radius() { radius = sqrt(x*x + y*y + z*z); }
      void big_calc();
};

void Cell::big_calc(){
   radius = sqrt(x*x + y*y + z*z);
   // ... lots more code, preventing in-lining
}

int main(int argc, char *argv[]) {
   Cell my_cells[1000];

   for (int i = 0; i < 1000; i++){
      my_cells[i].calc_radius();
   }
}
