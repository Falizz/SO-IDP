#!/bin/bash

gdb /desafio/exercicio

b main
r
info proc mappings

# 0x775555555000     0x775555ed1000   0x97c000        0x0  rwxp
