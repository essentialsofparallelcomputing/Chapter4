#include <stdio.h>

#define VCONST 4

const int V=VCONST;
struct SOA_type{
   int R[VCONST], G[VCONST], B[VCONST];
}; 

int main(int argc, char *argv[])
{
   int len=1000;
   struct SOA_type AOSOA[len/V];

   for (int j=0; j<len/V; j++){
      for (int i=0; i<V; i++){
         AOSOA[j].R[i] = 0;
         AOSOA[j].G[i] = 0;
         AOSOA[j].B[i] = 0;
      }
   }
}
