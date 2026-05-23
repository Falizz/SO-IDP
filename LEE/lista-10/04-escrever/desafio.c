#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>


int main()
{
    setvbuf( stdin, 0, 2, 0);
    setvbuf(stdout, 0, 2, 0);

    char buffer[0x100];
    char *hbuffer1, *hbuffer2;
    int lenw;

    int fd = open("password.txt", O_RDONLY);
    int len = read(fd, buffer, 0x100) - 1;

    close(fd);

    printf("O password possui %d bytes.\n", len);
    puts("Copiando para a heap!");

    hbuffer1 = malloc(len);
    hbuffer2 = malloc(len);

    strcpy(hbuffer2, "IDP-");
    memcpy(hbuffer2 + 4, buffer, len);

    memset(buffer, 0, 0x100);

    printf("Endereco de buffer1: %p\n", hbuffer1);
    printf("Endereco de buffer2: %p\n", hbuffer2);

    printf("Quantos bytes deseja digitar: ");
    scanf("%d", &lenw);

    printf("Digite os %d bytes: ", lenw);
    read(0, hbuffer1, lenw);

    printf("Saida: %s\n", hbuffer1);
    putchar(10);

    return 0;

}