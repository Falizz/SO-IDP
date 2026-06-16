 - Chamanda de Funções da libc (sistema operacional) -

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame a função printf para imprimir a recompensa
desta atividade, que encontra-se separada em 3 partes:

 - 0x4040c0
 - 0x405400
 - 0x408b40

Já o endereço da função printf encontra-se em:

 - [0x40bcd8]: 0x7ac7ade9a100

Para utilizar a função printf, você deverá colocar no
registrador RDI o endereço da string de formatação da saída.
Para isso, você poderá escrever essa string ao final do seu payload
e referenciar seu posicionamento utilizando endereçamento relativo
em relação ao contador de programa (RIP). Exemplo:

_start:
    lea rdi, [rip + str]
    nop
    nop
    nop
    ret
str: .asciz "%d - %s"

Perceba que, apesar do texto encontrar-se na área de código,
ele não será executado, pois a instrução ret irá retornar primeiro.
A partir disso, cada um dos endereços de formação deverão ser
colocados, em ordem, nos registrador RSI, RDX e RCX, respectivamente.
Obs: Lembre-se que para chamar funções, a pilha deve estar alinhada.

O seu payload será colocado na seguinte região de memória fixa:

 - 0x424242000