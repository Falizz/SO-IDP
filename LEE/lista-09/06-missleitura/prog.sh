#!/bin/bash

gcc -g /desafio/codigo.c -o /tmp/exercicio_cache
valgrind --tool=cachegrind --cache-sim=yes /tmp/exercicio_cache

# ==74== D1  misses:       22,129  (    1,256 rd   +  20,873 wr)

/desafio/validador