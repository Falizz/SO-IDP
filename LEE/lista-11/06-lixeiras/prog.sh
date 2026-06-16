#!/bin/bash

cd /desafio

gdb prog_00 # depois prog_01 e prog_02

#!gdb

disass main

b *main+76 # ponteiro para a última função malloc ou free

r

heap bins # verificar os bins
