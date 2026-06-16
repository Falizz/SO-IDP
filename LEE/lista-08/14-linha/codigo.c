#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>

char* frases[] = {
    "O galo ama o lago",
"A base do teto desaba",
"Aí, Lima falou: Ola, família",
"A base do teto desaba",
"Aí, Lima falou: Ola, família",
"Luz azul",
"Acuda cadela da Leda caduca",
"A mãe te ama",
"A dama admirou o rim da amada",
"A dama admirou o rim da amada",
"Arara rara",
"Luz azul",
"Subi no ônibus",
"Aí, Lima falou: Ola, família",
"Ajudem Edu já",
"Somos seres vivos, sapos são seres vivos, somos sapos?",
"Subi no ônibus",
"Aí, Lima falou: Ola, família",
"Socorram-me, subi no ônibus em Marrocos",
"A mala nada na lama",
"Ajudem Edu já",
"A sacada da casa",
"A mala nada na lama",
"Socorram-me, subi no ônibus em Marrocos",
"O galo ama o lago",
"O galo ama o lago",
"A lupa pula",
"O lobo ama o bolo",
"Somos seres vivos, sapos são seres vivos, somos sapos?"
    };

bool is_palindrome(const char* str) {
    char* normalized = strdup(str);
    if (normalized == NULL) {
        return false;
    }

    int write_index = 0;
    for (int read_index = 0; normalized[read_index]; read_index++) {
        if (isalnum(normalized[read_index])) {
            normalized[write_index++] = tolower(normalized[read_index]);
        }
    }
    normalized[write_index] = '\0';

    int start = 0;
    int end = write_index - 1;

    while (start < end) {
        if (normalized[start] != normalized[end]) {
            return false;
        }
        start++;
        end--;
    }

    return true;
}

void check_palindromes(char* strings[], int count) {
    for (int i = 0; i < count; i++) {
        if (is_palindrome(strings[i])) {
            printf("%s é um palíndromo\n", strings[i]);
        } else {
            printf("%s não é um palíndromo\n", strings[i]);
        }
    }
}

int main() {
    int nr = sizeof(frases) / sizeof(frases[0]);

    check_palindromes(frases, nr);

    char *frase;

    frase = malloc(100 * sizeof(char));

    strncpy(frase, frases[0], strlen(frases[0]));

    check_palindromes(&frase, 1);

    free(frase);

    return 0;
}