#include <stdlib.h>

int main(int argc, char *argv[])
{
   struct hash_type {
      int *key;
      int *value;
   } hash;
   hash.key   = (int *)malloc(1000*sizeof(int));
   hash.value = (int *)malloc(1000*sizeof(int));

}

