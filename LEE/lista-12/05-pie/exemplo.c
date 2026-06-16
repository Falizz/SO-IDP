#include <stdio.h>
#include <stdlib.h>

int funcao()
{
    puts("Sou uma função que só imprime!");
}

int main()
{
    printf("Endereco de funcao: %p\n", funcao);
    return 0;
}