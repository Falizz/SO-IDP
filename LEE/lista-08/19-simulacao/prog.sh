#!/bin/bash

gcc -g codigo.c -o codigo

valgrind --tool=cachegrind --cache-sim=yes ./codigo

# D1  miss rate:       1.8% (      0.1%     +     8.6%  )