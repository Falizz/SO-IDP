- Deslocamento de Bits

Um outro conjunto de instruções muito comum em linguagens de baixo nível é o
deslocamento de bits. Essas instruções são utilizadas para realizar operações
de multiplicação e divisão por potências de 2, além de outras operações
específicas, como a rotação de bits, tudo envolvendo apenas o deslocamento
dos bits de um registrador.

Tenha, por exemplo, o registrador AL, que é um registrador de 8 bits, com
o seguinte valor (em binário):

AL = 10001010

O deslocamento à esquerda, que é feito pela instrução shl, resulta em:

shl AL, 1

AL = 00010100

Nessa instrução, todos os bits do registrador são deslocados para a esquerda,
e o bit que sai do registrador é descartado. O bit que entra no registrador
é sempre 0. Além disso, o desclocamento à esquerda em um bit é equivalente
a multiplicar o valor do registrador por 2.

A instrução semelhante para o deslocamento à direita é shr, que faz o
deslocamento dos bits para a direita. O uso completo dessas duas instruções
é o seguinte:

    shl REG1, IMM1       <==>    Desloca IMM1 bits para a esquerda
    shl REG1, REG2       <==>    Desloca em REG1 a quantidade de bits
                                 em REG2 para a esquerda

    shr REG1, IMM1       <==>    Desloca IMM1 bits para a direita
    shr REG1, REG2       <==>    Desloca em REG1 a quantidade de bits
                                 em REG2 para a direita

Nesta atividade, utilizando apenas as instruções:

- MOV, SHR, SHL

você deverá colocar em RAX o resultado da multiplicação de r8 por 16384.

Valores inicializados: - r8: 0x58ba577e

Obs: Lembre-se de não modificar os valores originais dos registradores citados.
