#!/bin/bash

cd /desafio
gcc codigo.c -o programa
valgrind --tool=callgrind ./programa

# Collected : 8227012