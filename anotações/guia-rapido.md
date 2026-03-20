# Guia rápido para a escrita e submissão de código assembly

## Escrita de código assembly

### Montar o código .s e gerar o arquivo objeto .o

    $ as codigo.s -o codigo.o

### Ligar o arquivo objeto e gerar o executável

    $ ld codigo.o -o programa

### Extrair a seção .text do executável

    $ objcopy --dump-section .text=programa-intrucoes.bin programa

### Conferir os bytes gerados e extraídos

    $ xxd programa-intrucoes.bin

ou

    $ hd programa-intrucoes.bin

## Submissão das instruções para o desafio

### Submissão dos bytes do arquivo binário utilizando o comando cat

    $ cat programa-intrucoes.bin | ./exercicio

### Submissão de bytes "crus" diretamente, utilizando o comando echo (modo free style vida loka)

    $ echo -ne '\x90\x90\x90' | ./exercicio

Obs 01: Se o conteúdo do arquivo não estiver no formato correto (exemplo: tentar
submeter números em hexadecimal, ao invés dos bytes "crus"), o exercício não
aceitará a submissão (eu espero).

Obs 02: Caso o conteúdo do arquivo esteja correto, este será executado. Porém se
algum erro ocorrer durante a execução das instruções, um snapshot do processo
será impresso na saída padrão (aka registradores e pilha).

Obs 03: O desafio está na pasta /exercicio

## Debugging de código assembly

### Iniciando um programa que não possui main

Programas em assembly não tem a necessidade de possuir uma função main, para
serem executados. No GDB, para iniciar a execução de um programa em assembly que
possui apenas um entry point, utilize o comando abaixo:

    $ gdb ./programa -ex "set disassembly-flavor intel"
    $ starti

A partir deste ponto o contador de programa (RIP) irá apontar para a primeira
instrução a ser executada do programa e a utilização do gdb é a mesma de um
programa em C (que inclusive também aceita o comando starti, mas não irá estar
parado na main e sim na função \_start (teste!)).

Obs última: para sair deste guia, pressione `q`.
