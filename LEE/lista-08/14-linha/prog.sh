#!/bin/bash

cd /desafio
gcc codigo.c -o programa
valgrind ./programa

cat programa

# char* normalized = strdup(str);