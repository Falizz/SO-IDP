#!/bin/bash

/desafio/exercicio

# ==================== Substituição de Páginas - LRU (Aging) =====================

#  [+] Ciclo de atualização 1:

#      Página:   0  1  2  3  4  5  6  7  8
#      R:        1  0  1  0  1  0  1  0  1

#  [+] Ciclo de atualização 2:

#      Página:   0  1  2  3  4  5  6  7  8
#      R:        0  1  1  0  0  0  1  0  0

#  [+] Estado atual das páginas residentes:

#      Página   Contador
#      ------   --------
#           0   00011011
#           1   01101111
#           2   01011101
#           3   01110001
#           4   11010100
#           5   10011011
#           6   01000011
#           7   00001111
#           8   10001001

#  [-] Após executar todos os ciclos de atualização,
#      qual página é candidata à substituição?

#  [?] Página candidata: 7