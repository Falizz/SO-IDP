#!/bin/bash

mkdir /tmp/teste
ln -s /desafio/recompensa.txt /tmp/teste/recompensa
/bin/zip -r /tmp/out.zip /tmp/teste
/tmp$ unzip -p /tmp/out.zip