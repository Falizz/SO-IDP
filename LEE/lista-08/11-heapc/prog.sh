#!/bin/bash

cd /desafio
ltrace -e free ./programa 2>&1 | grep "free" | wc -l