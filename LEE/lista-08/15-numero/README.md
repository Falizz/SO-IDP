# Descrição

Nesta atividade, a pasta desafio possui um arquivo chamado `codigo.c`, que
contém um programa que realiza algumas instruções envolvendo laços e acessos a
posições arbitrárias de memória. Sua tarefa é contar a quantidade de instruções
que o o programa executa, utilizando a ferramenta `valgrind`.

`valgrind` é uma ferramenta de depuração que identifica problemas de
gerenciamento de memória em programas, como vazamentos e acessos inválidos. Ele
simula a execução do programa, monitorando a utilização de memória e gerando
relatórios detalhados para ajudar na correção de bugs. Esse software possui um
conjunto de ferramentas auxiliares, dentre elas, a `callgrind`, que serve para
gerar relatórios de instruçõers, acessos à cache e até predições de um programa.
(consulte em: <https://valgrind.org/docs/manual/cg-manual.html>)

Para gerar um relatório sobre a execução de um programa, utilizando o `valgrind`,
dado um programa chamado `programa`, basta executar o seguinte:

$ valgrind --tool=<ferramenta> ./programa

onde ferramenta é a ferramenta que deseja utilizar, como `callgrind`, por exemplo.

Após a execução, o `valgrind` irá gerar um arquivo chamado
`callgrind.out.<pid>`, que contém o relatório da execução do programa. Para
visualizar o relatório, há uma outra ferramenta instalada no sistema chamada
`cg_annotate`, que pode ser utilizada para visualizar o relatório gerado. Para
visualizar o relatório, basta executar o comando:

$ cg_annotate callgrind.out.<pid> codigo.c

Após obter o número de instruções que o programa executa, você deverá executar
o programa `validador`, que irá solicitar a resposta obtida, e caso esteja correta,
você receberá o código de resposta para a submissão da atividade.

Obs: O ambiente de execução pode interferir nos resultados obtidos, dessa forma
é recomendado utilizar o ambiente disponibilizado para a execução do programa.

Siglas:

- I cache reads (Ir): o número total de instruções executadas
– I1 cache read misses (I1mr): número de misses de leitura da cache L1 de instrução
– LL cache instruction read misses (ILmr): número de misses de leitura da cache L2 de instrução
– D cache reads (Dr): número de leituras da cache L1 de dados
– D1 cache read misses (D1mr): número de misses de leitura na cache L1 de dados
– LL cache data read misses (DLmr): o número de misses de leitura na cache L2 de dados
– D cache writes (Dw): número de escritas da cache L1 de dados
– D1 cache write misses (D1mw): o número de misses de escrita na cache L1 de dados
– LL cache data write misses (DLmw): o número de misses de escrita na cache L2 de dados
