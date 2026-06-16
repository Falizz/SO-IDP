- Intervalo

Dado o valor contido no registrador r13, o código deverá verificar se este
encontra-se estritamente entre os valores dos registradores r11 e r8.

       r11                 r13                           r8
        [-------------------------------------------------]

A verificação deverá retornar 1, se a verificação for verdadeira, e 0 caso
contrário. A resposta deverá ser inserida no registrador RAX.

Valores inicializados:

- r13: 0x23e944d0
- r11: 0x2623a60
- r8: 0x347360b0
- rax: 0xffffffffffffffff

Observação: serão executados múltiplos testes no código.
