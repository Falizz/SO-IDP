#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

char *alocacoes[8];
int ocupacoes[8];
int password_idx = -1;

void menu()
{
    puts("Menu:");
    puts("1 - Alocar");
    puts("2 - Liberar");
    puts("3 - Ler");
    puts("4 - Escrever");
    puts("5 - Carregar Password");
}

void alocar()
{
    int idx, len;

    printf("Digite o indice: ");
    scanf("%d", &idx);

    if ((idx < 0) || (idx > 7)) {
        puts("Indice invalido..");
        return;
    }

    if (ocupacoes[idx] != 0) {
        printf("Indice %d ja alocado.\n", idx);
        return;
    }
    printf("Digite o tamanho: ");
    scanf("%d", &len);

    alocacoes[idx] = malloc(len);
    ocupacoes[idx] = len;

}

void liberar()
{
    int idx, len;

    printf("Digite o indice: ");
    scanf("%d", &idx);

    if ((idx < 0) || (idx > 7)) {
        puts("Indice invalido..");
        return;
    }

    if (ocupacoes[idx] == 0) {
        puts("Area ja liberada!");
        return;
    }

    free(alocacoes[idx]);
    ocupacoes[idx] = 0;

    if (idx == password_idx) {
        password_idx = -1;
    }

}

void ler()
{
    int idx, len;

    printf("Digite o indice: ");
    scanf("%d", &idx);

    if ((idx < 0) || (idx > 7)) {
        puts("Indice invalido..");
        return;
    }

    if (ocupacoes[idx] == 0) {
        puts("Area nao alocada!");
        return;
    }

    printf("Digite a quantidade de bytes: ");
    scanf("%d", &len);

    printf("Digite o conteudo: ");

    read(0, alocacoes[idx], len);

}

void escrever()
{
    int idx, len;

    printf("Digite o indice: ");
    scanf("%d", &idx);

    if ((idx < 0) || (idx > 7)) {
        puts("Indice invalido..");
        return;
    }

    if (ocupacoes[idx] == 0) {
        puts("Area nao alocada!");
        return;
    }

    if (idx == password_idx) {
        puts("Indice alocado para o password. Acesso nao autorizado!");
        return;
    }

    printf("Conteudo: %s\n", alocacoes[idx]);

}

void carregar()
{
    const char base[] = "A resposta para a atividade eh: ";
    char buffer[0x100];
    int lenc = strlen(base);
    int idx, lenb;

    if (password_idx != -1) {
        printf("Password ja foi carregado para %d\n", password_idx);
        return;
    }

    printf("Digite o indice para carregar o password: ");
    scanf("%d", &idx);

    if ((idx < 0) || (idx > 7)) {
        puts("Indice invalido..");
        return;
    }

    int fd = open("password.txt", O_RDONLY);
    lenb = read(fd, buffer, 0x100) - 1;
    close(fd);

    alocacoes[idx] = malloc(lenc + lenb);
    ocupacoes[idx] = lenc + lenb;
    password_idx = idx;

    strcpy(alocacoes[idx], "A resposta para a atividade eh: ");
    strcpy(alocacoes[idx] + lenc, buffer);
    printf("Password de %d bytes carregado para o indice %d\n", lenb, idx);

    memset(buffer, 0, 0x100);

}
int main()
{
    setvbuf( stdin, 0, 2, 0);
    setvbuf(stdout, 0, 2, 0);

    int opcao;

    while (1) {
        menu();
        printf("Digite uma opcao: ");
        scanf("%d", &opcao);

        switch(opcao) {
            case 1: alocar(); break;
            case 2: liberar(); break;
            case 3: ler(); break;
            case 4: escrever(); break;
            case 5: carregar(); break;
            default: return 0;
        }
    }

    return 0;

}