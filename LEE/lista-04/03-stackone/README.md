- Finalmente Stack

A stack é uma região de memória designada para armazenar dados temporários. Ela
é organizada de forma que o último dado a ser armazenado é o primeiro a ser
recuperado, seguindo o princípio LIFO (Last In, First Out). O registrador RSP
(Stack Pointer) é utilizado para manter o endereço do topo da pilha, enquanto o
registrador RBP (Base Pointer) é utilizado para manter o endereço base da pilha.

                            +-------------------+
                0x808000    |                   | <- RSP
                            +-------------------+
                0x808008    |                   |
                0x808010    |                   |
                0x808018    |                   |
                   ...      |                   |
                            +-------------------+
                0x809000    |                   | <- RBP
                            +-------------------+

Em x86, as instruções PUSH e POP são utilizadas para inserir e remover dados da
pilha, respectivamente. A instrução PUSH decrementa o valor de RSP e armazena o
dado no endereço apontado por RSP, enquanto a instrução POP recupera o dado
armazenado no endereço apontado por RSP e incrementa o valor de RSP.

Utilizando essas instruções, realize o seguinte:

- Retire o valor do topo da pilha.
- Multiplique este pelo valor armazenado em r13.
- Coloque o resultado da operação no topo da pilha.

Valores inicializados: - r13 = 0x513e - (pilha) [0x7fffff1ffff8] = 0xfc686d3c
