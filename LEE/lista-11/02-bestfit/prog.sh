#!/bin/bash

/desafio/exercicio

# ======== Gerenciamento de Memória Livre - Listas Encadeadas - Best Fit =========

#  [+] Estado atual dos espaços livres, omitindo os blocos ocupados:

#          0           1           2           3           4           5
#       [ 950 ] --> [ 790 ] --> [ 850 ] --> [ 990 ] --> [ 240 ] --> [ 750 ]


#  [!] Nova requisição de uso de memória: 470

#  [?] Utilizandoa a política de alocação Best Fit, qual o estado final dos blocos livres?
#      [?] Bloco 0: 950
#      [?] Bloco 1: 790
#      [?] Bloco 2: 850
#      [?] Bloco 3: 990
#      [?] Bloco 4: 240
#      [?] Bloco 5: 280

# =================== Best Fit ===================
# Aloca no menor bloco livre que seja grande o suficiente.
