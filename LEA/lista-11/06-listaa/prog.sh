#!/bin/bash

/desafio/exercicio

# ================== Gerenciamento de Memória - Lista Encadeada ==================

#  [+] Memória total ...............: 192 KB
#  [+] Unidade de alocação .........: 4096 bytes
#  [=] Representação da memória:

# [ P 0 3    ] ---> [ P 3 9    ] ---> [ P 12 12  ] ---> [ L 24 10  ] ---> [ L 34 14  ]

#  [!] Baseado na representação acima, qual a quantidade total de memória livre (em bytes)?
#  [>] Resposta: 98304

# # =================== Cálculo ===================

# Soma da quantidade de espaços livres (L) na representação da memória:
# - L 24 10
# - L 34 14
# Total de memória livre = 10 + 14 = 24 * 4096 bytes (unidade de alocação) = 98304 bytes


