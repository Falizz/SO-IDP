#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <unistd.h>
#include <fcntl.h>

int main();

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
    unsigned long canary;

    __asm__ volatile(
        ".intel_syntax noprefix\n"
        "mov %0, fs:0x28\n"
        ".att_syntax prefix\n"
        : "=r"(canary)
    );

    printf("Main: %lX\n", main);
    printf("Canario: %lX\n", canary);

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