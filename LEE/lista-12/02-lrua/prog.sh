#!/bin/bash

/desafio/exercicio

# ======================== Substituição de Páginas - LRU =========================

#  [+] Estado atual das páginas residentes:

#      Página   R   Contador
#      ------   -   --------
#           0   1   00000010
#           1   1   01100001
#           2   1   01000000
#           3   0   11011111
#           4   1   01011011
#           5   0   10011011
#           6   0   00000000
#           7   1   11110111
#           8   1   01011010
#           9   0   11110110
#          10   1   10101010
#          11   0   01001010
#          12   1   10110101
#          13   1   01111000

#  [-] Na próxima interrupção de relógio, qual página é candidata à substituição?

#  [?] Página candidata: 6