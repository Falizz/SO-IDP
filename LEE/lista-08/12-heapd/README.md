# Descrição

Nesta atividade, a pasta desafio possui um arquivo chamado `programa`, que é um
binário que realiza algumas instruções envolvendo alocação dinâmica de memória.
Sua tarefa é verificar a quantidade total de memória heap utilizada por esse
programa, utilizando a ferramenta `valgrind` para isso.

`valgrind` é uma ferramenta de depuração que identifica problemas de
gerenciamento de memória em programas, como vazamentos e acessos inválidos. Ele
simula a execução do programa, monitorando a utilização de memória e gerando
relatórios detalhados para ajudar na correção de bugs. Esse software possui um
conjunto de ferramentas auxiliares, dentre elas, a `callgrind`, que serve para
gerar relatórios de instruçõers, acessos à cache e até predições de um programa.
(consulte em: <https://valgrind.org/docs/manual/cg-manual.html>)

Para gerar um relatório sobre a execução de um programa, utilizando o `valgrind`,
dado um programa chamado `programa`, basta executar o seguinte:

$ valgrind ./programa

Após obter a resposta para a atividade, você deverá executar o programa
`validador`, que irá solicitar a resposta obtida, e caso esteja correta, você
receberá o código de resposta para a submissão da atividade.
