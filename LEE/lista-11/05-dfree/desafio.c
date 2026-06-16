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
    puts("5 - Password");
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

void password()
{
    write(1, "TODO: Implementar funcao password\n", 32);
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
            case 5: password(); break;
            default: return 0;
        }
    }

    return 0;

}