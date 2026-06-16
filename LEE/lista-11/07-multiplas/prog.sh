#!/bin/bash

/desafio/exercicio

# ======== Gerenciamento de Memória Livre - Listas Encadeadas - Worst Fit ========

#  [+] Estado atual dos espaços livres, omitindo os blocos ocupados:

#                      0           1           2           3
#                   [ 700 ] --> [  80 ] --> [ 340 ] --> [ 750 ]


#  [!] Requisições de uso de memória: 80, 370, 390

#  [?] Utilizandoa a política de alocação Worst Fit, qual o estado final dos blocos livres?
#      [?] Bloco 0: 330
#      [?] Bloco 1: 80
#      [?] Bloco 2: 340
#      [?] Bloco 3: 280