#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>


int main()
{
    char buffer[0x100];
    char *hbuffer1, *hbuffer2;
    int offset;

    int fd = open("password.txt", O_RDONLY);
    int len = read(fd, buffer, 0x100) - 1;

    close(fd);

    printf("O password possui %d bytes.\n", len);
    puts("Copiando para a heap!");

    hbuffer1 = malloc(len + 100 + random() % 100);
    hbuffer2 = malloc(len       + random() %  50);

    strcpy(hbuffer1, "AAAABBBBCCCCDDDD");
    memcpy(hbuffer2, buffer, len);
    
    memset(buffer, 0, 0x100);

    printf("Endereco de buffer1: %p\n", hbuffer1);
    printf("Endereco de buffer2: %p\n", hbuffer2);
    printf("Digite o offset para ler a partir da posicao de buffer1: ");
    scanf("%d", &offset);

    write(1, hbuffer1 + offset, len);
    putchar(10);

    return 0;
}