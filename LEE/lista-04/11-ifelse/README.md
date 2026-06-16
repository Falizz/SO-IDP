- Condicionais

Condicionais são um dos mecanismos mais poderosos e fundamentais em programação.
Eles permitem que um programa tome decisões com base em valores dinâmicos
fornecidos ao programa. Uma estrutura de condição pode ser escrita da seguinte
forma:

    if x for par:
        y = 1
    else:
        y = 0

Nessas estruturas, podemos controlar o fluxo de controle do programa com base em
valores dinâmicos fornecidos ao programa. Em linguagens de baixo nível, esse
fluxo pode ser controlado com uma de diversas instruções de salto condicional.
Em todas elas, o ZF (Zero Flag) é fundamental. O ZF é definido como 1 quando uma
comparação é igual e 0 caso contrário.

Utilizando estruturas condicionais, implemente o seguinte:
if [x] for par:
y = 1
else:
y = 0

onde:
x = r9
y = rax

Nesta atividade, serão executados múltiplos casos de testes. Aqui está um
exemplo:

(dados) [0x404000] = {1 dword]}
r9 = 0x404000
