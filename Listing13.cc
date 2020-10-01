#include <stdio.h>

const int V=4;
struct SoA_type{
   int R[V], G[V], B[V];
}; 

int main(int argc, char *argv[])
{
   int len=1000;
   struct SoA_type AoSoA[len/V];

   for (int j=0; j<len/V; j++){
      for (int i=0; i<V; i++){
         AoSoA[j].R[i] = 0;
         AoSoA[j].G[i] = 0;
         AoSoA[j].B[i] = 0;
      }
   }
}
