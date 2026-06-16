- Operadores Lógicos

Em x86, é possível realizar muitas operações lógicas bit a bit em registradores.

Utilizando como exemplo registradores de 8 bits, veja o seguinte:

rax = 10101010
rbx = 00110011

O operador AND entre os registradores é feito da seguinte forma:

    and rax, rbx

cujo o resultado é:

    rax = 00100010

Segue uma tabela com as operações lógicas disponíveis:

              AND          OR           XOR
           A | B | X    A | B | X    A | B | X
          ---+---+---  ---+---+---  ---+---+---
           0 | 0 | 0    0 | 0 | 0    0 | 0 | 0
           0 | 1 | 0    0 | 1 | 1    0 | 1 | 1
           1 | 0 | 0    1 | 0 | 1    1 | 0 | 1
           1 | 1 | 1    1 | 1 | 1    1 | 1 | 0

Nesta atividade, você deverá realizar a operação lógica AND entre os registradores
rsi e r12 e armazenar o resultado em rax.

Para esta atividade, as seguintes instruções NÃO estão disponíveis:

    - MOV, XCHG

Valores inicializados: - rsi: 0x58031198f9ab2296 - r12: 0x74771a6f73b21495
