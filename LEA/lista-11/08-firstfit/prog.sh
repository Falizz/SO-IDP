#!/bin/bash

/desafio/exercicio

# ======== Gerenciamento de Memória Livre - Listas Encadeadas - First Fit ========

#  [+] Estado atual dos espaços livres, omitindo os blocos ocupados:

#                      0           1           2           3
#                   [ 770 ] --> [ 970 ] --> [ 290 ] --> [ 800 ]


#  [!] Nova requisição de uso de memória: 470

# [?] Utilizandoa a política de alocação First Fit, qual o estado final dos blocos livres?
#      [?] Bloco 0: 300
#      [?] Bloco 1: 970
#      [?] Bloco 2: 290
#      [?] Bloco 3: 800

# =================== First Fit ===================
# Aloca no primeiro bloco livre que for grande o suficiente