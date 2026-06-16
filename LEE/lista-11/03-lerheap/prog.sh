!#/bin/bash

gdb /desafio/exercicio

#!gdb

info proc mappings

# 0x566bc0ce2000     0x566bc0d03000    0x21000        0x0  rw-p   [heap]

x/200s 0x566bc0ce2260

# 0x566bc0ce22a0: "IDP-OZNAUBBDRSQGGQHS"