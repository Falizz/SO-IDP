- Resto da Divisão

A operação de divisão em x86-64 também pode ser utilizada para calcular o resto
da divisão. Exemplo:

10 / 3 = 3, resto 1

ou, se o interesse for apenas no resto, a operação pode ser escrita da seguinte
forma:

10 % 3 = 1

onde esse operador é chamado de módulo, que retorna o resto da divisão. Neste
exercício, sua tarefa é calcular o seguinte:

    rdx % rbx

E o resultado deverá ser armazenado no registrador rax.

Valores inicializados: - rdx: 0x6f9534c765cb65 - rbx: 0x3ff

Obs: Lembre-se de não modificar os valores originais dos registradores citados.
