#!/bin/bash

/desafio/exercicio

# ======== Gerenciamento de Memória Livre - Listas Encadeadas - Worst Fit ========

#  [+] Estado atual dos espaços livres, omitindo os blocos ocupados:

#                0           1           2           3           4
#             [ 690 ] --> [ 380 ] --> [ 160 ] --> [ 250 ] --> [ 820 ]


#  [!] Nova requisição de uso de memória: 610

#  [?] Utilizandoa a política de alocação Worst Fit, qual o estado final dos blocos livres?
#      [?] Bloco 0: 690
#      [?] Bloco 1: 380
#      [?] Bloco 2: 160
#      [?] Bloco 3: 250
#      [?] Bloco 4: 210

# =================== Worst Fit ===================
# Worst Fit: Aloca no maior bloco livre disponível na memória.
