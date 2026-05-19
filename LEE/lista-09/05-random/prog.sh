#!/bin/bash

cd /desafio

gdb exercicio

#!gdb

b main
r
info proc mappings

# 0x5555d2e34000     0x5555d2e44000    0x10000        0x0  rwxp

search-pattern "IDP-"

# 0x5555d2e425ea:    49 44 50 2d 4d 58 5a 57  42 56 4e 42 4b 57 59 46    |  IDP-MXZWBVNBKWYF  |

x/s 0x5555d2e425ea

# 0x5555d2e425ea: "IDP-MXZWBVNBKWYFRTTF"