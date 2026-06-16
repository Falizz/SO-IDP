# Descrição

Com esse problema de stack overflow, desenvolvedores buscaram uma alternativa
para dar proteção contra ataques que exploram esse vulnerabilidade. Diretamente
ligado ao compilador, temos um mecanismo chamado de stack canary.

Durante a execução de um programa, o compilador insere automaticamente um valor
especial e aleatório — conhecido como canário — no início do stack frame das
funções. Esse valor é gerado na inicialização do programa e permanece secreto
durante a execução. Antes de uma função retornar, o programa verifica se o
valor do canário permanece inalterado. Caso o valor tenha sido modificado, o programa
identifica uma possível violação de "transbordamento" de memória, ou buffer
overflow, e encerra sua execução imediatamente, emitindo a mensagem:
 *** stack smashing detected ****.

Uma visualização da organiação de memória de um processo, em um stack frame
específico, com a presença do stack canary é a seguinte:

Endereços mais baixos
                      +-------------------------------+
                      | Variáveis locais (buffer)     |
                      +-------------------------------+
                      | Stack Canary (aleatório)      |
                      +-------------------------------+
                      | RBP salvo da função chamadora |
                      +-------------------------------+
                      | Endereço de retorno da função |
                      +-------------------------------+
Endereços mais altos

Assim, nesta atividade, há um programa chamado `exercicio`, o qual o código
utilziado para gerar o seu conteúdo está no arquivo `codigo.c`. Este programa
possui a proteção de stack canary ativada, e inclusive vou mostrá-lo a você,
no início da execução.

Observação: esse programa vai necessitar de interação avançada com o programa
para ser resolvido (não é trivial enviar bytes para o programa digitando pelo
teclado). A recomendação é buscar alternativas para interagir via script com o
programa (uma boa ferramenta é a pwntools (biblioteca do python)).