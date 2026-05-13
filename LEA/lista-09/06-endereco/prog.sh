#!/bin/bash

cd /desafio
gdb exercicio

#!gdb

b main
r
info proc mappings

#           Start Addr           End Addr       Size     Offset  Perms  objfile
#       0x55444d753000     0x55444d775000    0x22000        0x0  rwxp