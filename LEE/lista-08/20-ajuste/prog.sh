#!/bin/bash

cd /desafio/

gcc codigo.c -o programa

valgrind --tool=cachegrind --cache-sim=yes --D1=2097152,32,32 ./programa

# D1  misses:       210,632  (     1,830 rd   +   208,802 wr)

valgrind --tool=cachegrind --cache-sim=yes --D1=2097152,1,32 ./programa

# D1  misses:       195,119  (     3,986 rd   +   191,133 wr)

valgrind --tool=cachegrind --cache-sim=yes --D1=2097152,4,32 ./programa

# D1  misses:       201,456  (     1,860 rd   +   199,596 wr)