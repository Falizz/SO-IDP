#!/bin/bash

cd /desafio

gdb exercicio

#!gdb

b main
r
info proc mappings

# 0x5555a1add000     0x5555a1ae0000     0x3000        0x0  rwxp

x/s 0x5555a1add000

# 0x5555a1add000: "IDP-QBVWPXLNAQTXLUII