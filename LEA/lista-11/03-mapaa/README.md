# Descrição

Quando a memória é alocada dinamicamente, o Sistema Operacional precisa
gerenciar quais regiões estão livres e quais estão ocupadas. Uma das formas mais
simples de realizar esse gerenciamento é utilizando um Mapa de Bits.

Nesse método, a memória é dividida em unidades de alocação de tamanho fixo.
Cada unidade é representada por um único bit no mapa:

- 0     ->  unidade livre
- 1     ->  unidade ocupada

Nesta atividade, há um arquivo chamado `exercicio`, dentro da pasta `/desafio`,
que socilitará o tamanho da unidade de alocação de memória, dado o tamanho
total da memória e a quantidade total de blocos existentes.