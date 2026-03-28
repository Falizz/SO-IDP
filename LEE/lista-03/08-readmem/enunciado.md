- Leitura de Memória

Até o momento, todos os exercícios foram focados em operações envolvendo apenas
registradores e essencialmente operações lógicas ou aritméticas. Neste
exercício, vamos introduzir a manipulação de memória.

Ao lidar com memória, qualquer posição pode ser endereçada, e cada endereço irá
conter algum valor naquela posição. Se pensarmos no endereço 'Setor de Grandes
Áreas Norte 609 - Asa Norte, Brasília - DF', este se refere a um local
específico, e não a um valor.

Como forma de abstrair, poderíamos considerar o seguinte:

    ['Setor de Grandes Áreas Norte 609 - Asa Norte, Brasília - DF'] = 'IDP - Asa Norte'

É válido reforçar que diferentes endereços podem apontar para uma mesma posição
de memória.

    ['70830-401'] = 'IDP - Asa Norte'

A memória do computador se comporta da mesma forma. As instruções do seu
programa são referenciadas por um endereço de memória, e neste caso é
0x400000.

Na arquitetura x86, o acesso a endereços é chamado de dereferência. Para acessar
o valor de um endereço de memória, é necessário utilizar colchetes. Por exemplo,
para acessar um valor armazenado, pode-se fazer:

    mov rax, [endereco]         <==> Move o valor armazenado no endereço para o
                                     registrador rax

O mesmo é válido a partir de outros registradores, como rdi, rsi, rdx, etc.

    mov rax, [rdi]             <==> Move o valor armazenado no endereço apontado
                                    por rdi para rax

E também pode ser utilizado para escrever valores em endereços de memória.

    mov [rdi], rax             <==> Move o valor armazenado em rax para o
                                    endereço apontado por rdi

Memória é algo contíguo, ou seja, endereços válidos vão de 0x0 até 0xFFFFFFFFFFFFFFFF.

Nesta atividade, você deverá ler o valor armazenado em 0x404000 e inserí-lo no
registrador rcx.
