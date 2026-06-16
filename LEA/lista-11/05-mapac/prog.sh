#!/bin/bash

cd /desafio

./exercicio

# =================== Gerenciamento de Memória - Mapa de Bits ====================

#  [+] Memória total ..............: 32768 KB
#  [+] Unidade de alocação ........: 2097152 bytes
#  [+] Quantidade de blocos .......: 16

#      O mapa de bits abaixo representa o estado atual da memória principal:

# 0101000001111101

#  [!] Com base no mapa acima, qual é a quantidade total de memória LIVRE em bytes?

#  [>] Resposta: 16777216

# =================== Cálculo ===================
#     Tamanho total da memória = 32768 KB = 32768 * 1024 bytes = 33554432 bytes
#     Unidade de alocação = 2097152 bytes
#     Quantidade de blocos = 16
#     Quantidade de blocos LIVRES = 8
#     Quantidade total de memória LIVRE = Quantidade de blocos LIVRES * Unidade de alocação