#!/bin/bash

/desafio/exercicio

# ================== Gerenciamento de Memória - Lista Encadeada ==================

#  [+] Unidade de alocação .........: 512 bytes

#  [=] Representação da memória:

# [ L 0 2    ] ---> [ P 2 1    ] ---> [ P 3 1    ] ---> [ L 4 1    ] ---> [ L 5 1    ] --->
# [ P 6 2    ] ---> [ P 8 3    ] ---> [ P 11 5   ]

#  [!] Baseado na representação acima, qual é a quantidade total de memória (em bytes)?
#  [>] Resposta: 8192

# # =================== Cálculo ===================

# Soma da quantidade de espaços na representação da memória:
# Total de espaços na memória = 2 + 1 + 1 + 1 + 1 + 2 + 3 + 5 = 16 * 512 bytes (unidade de alocação) = 8192 bytes


