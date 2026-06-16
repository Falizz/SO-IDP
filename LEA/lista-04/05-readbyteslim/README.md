- Leitura de Bytes

A movimentação de conteúdo (leitura e escrita) entre memória e cpu possui um
custo muito alto para a performance de programas. Por isso, deve-se evitar ao
máximo utilizar essas movimentações.

Limitado as seguintes quantidades de instruções:
    - MOV: máximo de 1 instrução

Execute o seguinte:
- Leia um byte que encontra-se no endereço 0x404000 para o registrador rbp
- Leia um byte que encontra-se no endereço 0x404001 para o registrador rsi
- Leia um byte que encontra-se no endereço 0x404002 para o registrador rax
- Leia um byte que encontra-se no endereço 0x404003 para o registrador r9

Valores inicializados:
        - ( 8 bytes) [0x404000] = 0xa38416b6b97e5025
        - ( 1 byte ) [0x404000] = 0x25
        - ( 1 byte ) [0x404001] = 0x50
        - ( 1 byte ) [0x404002] = 0x7e
        - ( 1 byte ) [0x404003] = 0xb9
       -                   rax = 0xffffffffffffffff
       -                   rbx = 0xec03827839e482c8
       -                   rcx = 0x9607b4a8f88a9647
       -                   rdx = 0xa57db0195082eebe
       -                   rsi = 0xffffffffffffffff
       -                   rdi = 0x3f825597eb7609c2
       -                   rbp = 0xffffffffffffffff
       -                   rsp = 0x98756cc3d585f98c
       -                    r8 = 0x6af47c6b5f352454
       -                    r9 = 0xffffffffffffffff
       -                   r10 = 0x4cea095593c4f6cf
       -                   r11 = 0xefa304afb06559c6
       -                   r12 = 0x6095aedbefbcafe6
       -                   r13 = 0x785049e020b478f8
       -                   r14 = 0x978910c7726d298f
       -                   r15 = 0xd1543e7ad438bd01