#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

void objetivo()
{

    char buffer[0x100];

    int fd = open("password.txt", O_RDONLY);
    read(fd, buffer, 0x100) - 1;
    close(fd);

    printf("Resposta: %s\n", buffer);

}

void vuln()
{

    char buffer[100];
    printf("Digite o conteudo: ");
    read(0, buffer, 0x100);

}


int main()
{
    setvbuf( stdin, 0, 2, 0);
    setvbuf(stdout, 0, 2, 0);

    vuln();

    return 0;

}