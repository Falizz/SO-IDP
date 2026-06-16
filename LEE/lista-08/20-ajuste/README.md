# Descrição

Nesta atividade, a pasta desafio possui um arquivo chamado `codigo.c`, que
contém um programa que realiza algumas operações diversas. Sua tarefa é simular
a execução do programa, ajustando o número de "misses" da cache L1 de dados,
utilizando a ferramenta `valgrind` com a ferramenta `cachegrind`.

Para simular a execução do programa, é necessário passar o parâmetro
`--cache-sim=yes`, assim este irá simular a execução do programa, contando os
acessos e misses das caches presentes no sistema. Além disso, é possível ajustar
as configurações da memória, durante a simulação. Isso pode ser feito da seguinte
forma:

```
valgrind --tool=cachegrind --cache-sim=yes --D1=<tamanho da memória>,<associatividade>,<tamanhod o bloco> ./prog
```

Nesta atividade, você deverá executar o programa `validador`, para saber as
informações a respeito do tamanho da memória de dados da cache L1, o tamanho do
bloco, e os possíveis valores para a associatividade que deverão ser utilizados
na simulação. Após executar os ajustes, o `validador`, deverá receber o número
mínimo de misses da cache L1 de dados, e caso a resposta esteja correta, você
receberá o código de resposta para a submissão da atividade.

Obs: O ambiente de execução pode interferir nos resultados obtidos, dessa forma
é recomendado utilizar o ambiente disponibilizado para a execução do programa.

Obs 02: Não se esqueça de adicionar os símbolos de depuração ao código, para
facilitar a análise do relatório gerado pelo `valgrind`.

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
