#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>

void handler(){

    char buffer[0x100];

    int fd = open("password.txt", O_RDONLY);
    read(fd, buffer, 0x100) - 1;
    close(fd);

    printf("Resposta: %s\n", buffer);

    exit(1);

}

int main()
{
    setvbuf( stdin, 0, 2, 0);
    setvbuf(stdout, 0, 2, 0);

    signal(SIGSEGV, handler);

    char buffer[100];

    printf("Digite o conteudo: ");

    read(0, buffer, 0x100);

    return 0;

}