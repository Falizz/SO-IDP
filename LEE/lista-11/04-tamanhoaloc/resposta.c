#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

int main (void) {

    void *ptr = malloc(547);
    size_t real = malloc_usable_size(ptr);
    printf("%lu\n", real);
    return 0;
}