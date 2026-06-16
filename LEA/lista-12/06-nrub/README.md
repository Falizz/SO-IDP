# Descrição

Quando a memória principal está cheia e uma nova página precisa ser carregada,
o Sistema Operacional precisa escolher uma das páginas residentes para
ser removda. Essa decisão é tomada por um algoritmo de substituição de páginas,
cujo objetivo é minimizar a ocorrência de faltas de página e melhorar o
desempenho geral do sistema.

Um desses algoritmos é o NRU (Not Recently Used), que utiliza dois bits
associados a cada página: o bit de referência (R) e o bit de modificação
(M). O bit R indica se a página foi acessada recentemente, enquanto o
bit M indica se seu conteúdo foi alterado desde que foi carregada na
memória.

Com base nesses bits, as páginas são classificadas em quatro classes:

| Classe  | R | M |
|---------|---|---|
|    0    | 0 | 0 |
|    1    | 0 | 1 |
|    2    | 1 | 0 |
|    3    | 1 | 1 |

Ao ocorrer uma falta de página, o algoritmo procura a menor classe não vazia e
seleciona uma das páginas pertencentes a essa classe para substituição. Se duas
páginas pertencerem à mesma classe, a escolha entre elas é feita de forma
aleatória.

Nesta atividade, será apresentado o estado atual das páginas residentes na
memória, juntamente com seus respectivos bits R e M. Seu objetivo é determinar
quais páginas são candidatas à substituição segundo o algoritmo NRU.