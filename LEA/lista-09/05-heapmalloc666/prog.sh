#!/bin/bash

ltrace -e malloc /desafio/programa

# programa->malloc(456)                                                                           = 0x55f00b8acac0
# programa->malloc(348)                                                                           = 0x55f00b8acc90
# ...
# programa->malloc(384)                                                                           = 0x55f00b8b05f0
# programa->malloc(248)                                                                           = 0x55f00b8b0780
# +++ exited (status 0) +++

ltrace -e malloc /desafio/programa 2>&1 | awk -F '[()]' '/malloc/ {s+=$2} END {print s}'

# 14936

/desafio/validador