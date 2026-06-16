#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>

#define PAGE_SIZE   0x1000
#define LINE_SIZE   64
#define LINE_A      2
#define LINE_B      15
char __attribute__((aligned(PAGE_SIZE))) buffer[PAGE_SIZE] = {0};
#define votos_a     buffer[LINE_A*LINE_SIZE+2]
#define votos_b     buffer[LINE_B*LINE_SIZE+2]
#define SAMPLES     10

void votar(char candidato)
{
    if (candidato == 'a') {
        votos_a++;
    } else {
        votos_b++;
    }
}

void flush(void *addr)
{
    asm(
        ".intel_syntax noprefix\n"
        "mfence\n"
        "clflush [%0]\n"
        "mfence\n"
        ".att_syntax prefix\n"
    :
    : "r"(addr)
    : "rax"
    );
}

int reload( void * adrs)
{
    volatile unsigned long time;

    asm volatile (
    "mfence\n\t"
    "lfence\n\t"
    "rdtsc\n\t"
    "lfence\n\t"
    "movl %%eax, %%esi\n\t"
    "movl (%1), %%eax\n\t"
    "lfence\n\t"
    "rdtsc\n\t"
    "subl %%esi, %%eax \n\t"
    : "=a" (time)
    : "c" (adrs)
    : "%rsi", "%rdx");

    return (int) time;
}

void print_menu()
{
    puts("Menu:");
    puts(" 1 - Votar");
    puts(" 2 - Flush A");
    puts(" 3 - Flush B");
    puts(" 4 - Reload A");
    puts(" 5 - Reload B");
    puts(" 6 - (Reload A, votar, Flush A)");
    puts(" 7 - (Reload B, votar, Flush B)");
    puts(" 8 - (Flush A, votar, Reload A)");
    puts(" 9 - (Flush B, votar, Reload B)");
    puts("10 - (Reload A, votar, Flush B)");
    puts("11 - (Reload B, votar, Flush A)");
    puts("12 - (Flush A, votar, Reload B)");
    puts("13 - (Flush B, votar, Reload A)");
    puts("14 - (Flush A, Flush B, votar, Reload A, Reload B)");
    puts("15 - (Flush A, Flush B, votar, Reload B, Reload A)");
    puts("16 - (Reload A, Reload B, votar, Flush A, Flush B)");
    puts("17 - (Reload B, Reload A, votar, Flush A, Flush B)");
    printf("Opcao: ");

}
int main()
{
    int seed;
    fread(&seed, sizeof(seed), 1, fopen("/dev/urandom", "rb"));
    srand(seed);

    unsigned long long tempo, tempo_a, tempo_b;
    int opcao, total_votos = 0, nr_votos_a, nr_votos_b, nr_votos;
    char proximo_voto_secreto;

    do {
        proximo_voto_secreto = rand() % 2 ? 'a' : 'b';
        print_menu();
        scanf(" %d", &opcao);
        switch (opcao) {
            case 1:
                votar(proximo_voto_secreto);
                total_votos++;
                break;
            case 2:
                for (int i = 0; i < SAMPLES; ++i) flush(&votos_a);
                break;
            case 3:
                for (int i = 0; i < SAMPLES; ++i) flush(&votos_b);
                break;
            case 4:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    tempo += reload(&votos_a);
                }
                printf("A (media): %llu\n", tempo / SAMPLES);
                break;
            case 5:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    tempo += reload(&votos_b);
                }
                printf("B (media): %llu\n", tempo / SAMPLES);
                break;
            case 6:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    tempo += reload(&votos_a);
                    votar(proximo_voto_secreto);
                    flush(&votos_a);
                }
                printf("A (media): %llu\n", tempo / SAMPLES);
                total_votos++;
                break;
            case 7:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    tempo += reload(&votos_b);
                    votar(proximo_voto_secreto);
                    flush(&votos_b);
                }
                printf("B (media): %llu\n", tempo / SAMPLES);
                total_votos++;
                break;
            case 8:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    flush(&votos_a);
                    votar(proximo_voto_secreto);
                    tempo += reload(&votos_a);
                }
                printf("A (media): %llu\n", tempo / SAMPLES);
                total_votos++;
                break;
            case 9:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    flush(&votos_b);
                    votar(proximo_voto_secreto);
                    tempo += reload(&votos_b);
                }
                printf("B (media): %llu\n", tempo / SAMPLES);
                total_votos++;
                break;
            case 10:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    tempo += reload(&votos_a);
                    votar(proximo_voto_secreto);
                    flush(&votos_b);
                }
                printf("A (media): %llu\n", tempo / SAMPLES);
                total_votos++;
                break;
            case 11:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    tempo += reload(&votos_b);
                    votar(proximo_voto_secreto);
                    flush(&votos_a);
                }
                printf("B (media): %llu\n", tempo / SAMPLES);
                total_votos++;
                break;
            case 12:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    flush(&votos_a);
                    votar(proximo_voto_secreto);
                    tempo += reload(&votos_b);
                }
                printf("B (media): %llu\n", tempo / SAMPLES);
                total_votos++;
                break;
            case 13:
                tempo = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    flush(&votos_b);
                    votar(proximo_voto_secreto);
                    tempo += reload(&votos_a);
                }
                printf("A (media): %llu\n", tempo / SAMPLES);
                total_votos++;
                break;
            case 14:
                tempo_a = 0;
                tempo_b = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    flush(&votos_a);
                    flush(&votos_b);
                    votar(proximo_voto_secreto);
                    tempo_a += reload(&votos_a);
                    tempo_b += reload(&votos_b);
                }
                printf("A (media): %llu, B (media): %llu\n", tempo_a / SAMPLES, tempo_b / SAMPLES);
                total_votos++;
                break;
            case 15:
                tempo_a = 0;
                tempo_b = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    flush(&votos_a);
                    flush(&votos_b);
                    votar(proximo_voto_secreto);
                    tempo_b += reload(&votos_b);
                    tempo_a += reload(&votos_a);
                }
                printf("A (media): %llu, B (media): %llu\n", tempo_a / SAMPLES, tempo_b / SAMPLES);
                total_votos++;
                break;
            case 16:
                tempo_a = 0;
                tempo_b = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    tempo_a += reload(&votos_a);
                    tempo_b += reload(&votos_b);
                    votar(proximo_voto_secreto);
                    flush(&votos_a);
                    flush(&votos_b);
                }
                printf("A (media): %llu, B (media): %llu\n", tempo_a / SAMPLES, tempo_b / SAMPLES);
                total_votos++;
                break;
            case 17:
                tempo_a = 0;
                tempo_b = 0;
                for (int i = 0; i < SAMPLES; ++i) {
                    tempo_b += reload(&votos_b);
                    tempo_a += reload(&votos_a);
                    votar(proximo_voto_secreto);
                    flush(&votos_a);
                    flush(&votos_b);
                }
                printf("A (media): %llu, B (media): %llu\n", tempo_a / SAMPLES, tempo_b / SAMPLES);
                total_votos++;
                break;

            default: puts("Opcao invalida");

        }

    } while (total_votos < 10);

    nr_votos_a = votos_a / SAMPLES;
    nr_votos_b = votos_b / SAMPLES;

    printf("Digite o numero de votos para A: ");
    scanf(" %d", &nr_votos);

    if (nr_votos != nr_votos_a) {
        puts("Numero de votos para A incorreto!");
        return -1;
    }

    printf("Digite o numero de votos para B: ");
    scanf(" %d", &nr_votos);
    if (nr_votos != nr_votos_b) {
        puts("Numero de votos para B incorreto!");
        return -1;
    }

    printf("Parabens. Recompensa: ");

    int fd = open("/desafio/password.txt", O_RDONLY);
    char flag[100];
    read(fd, flag, 100);
    write(1, flag, 100);

    return 0;
}