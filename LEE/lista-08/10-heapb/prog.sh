#!/bin/bash

cd /desafio
ltrace -e malloc ./programa 2>&1 | grep "malloc" | wc -l