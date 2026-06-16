# Descrição

Quando a memória é alocada dinamicamente, o Sistema Operacional precisa
gerenciar quais regiões estão livres e quais estão ocupadas. Uma das formas mais
simples de realizar esse gerenciamento é utilizando um Mapa de Bits.

Nesse método, a memória é dividida em unidades de alocação de tamanho fixo.
Cada unidade é representada por um único bit no mapa:

- 0     ->  unidade livre
- 1     ->  unidade ocupada

Nesta atividade, há um arquivo chamado `exercicio`, dentro da pasta `/desafio`,
que exibirá um mapa de bits representando o estado da memória principal. Seu
objetivo será calcular a quantidade total de memória livre, para os casos
solicitados.