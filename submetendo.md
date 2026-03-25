as prog.s -o prog.o
ld prog.o -o prog
objcopy --dump-section .text=prog.bin prog
cat prog.bin | ./exercicio
