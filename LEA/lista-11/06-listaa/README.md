# Descrição

Quando a memória é alocada dinamicamente, o Sistema Operacional precisa
acompanhar quais regiões estão livres e quais estão ocupadas. Uma outra forma de
realizar esse gerenciamento é utilizando uma Lista Encadeada.

Nesse método, a memória é representada por uma sequência de nós, onde cada nó
descreve uma região contígua da memória principal. Cada entrada da lista contém:

- O tipo da região;
- A posição inicial; e
- O tamanho da região.

Os tipos utilizados são:

- `P` -> região ocupada por um processo; e
- `L` -> uma região livre da memória (as vezes aparece como `H` de hole).

Cada nó aponta para o próximo elemento da lista, permitindo que o sistema
operacional percorra toda a memória e identifique rapidamente áreas livres e
ocupadas.

Nesta atividade, há um arquivo chamado `exercicio`, dentro da pasta `/desafio`,
que exibirá uma representação de uma lista encadeada de memória. Cada nó da
lista representa uma região da memória principal. Seu objetivo será analisar a
estrutura apresentada e calcular a quantidade total de memória livre.

Obs: A lista não está consolidando a memória livre (ainda), só para exercitar a
leitura da estrutura.