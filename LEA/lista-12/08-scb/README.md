# Descrição

Quando a memória principal está cheia e uma nova página precisa ser carregada, o
Sistema Operacional precisa escolher uma das páginas residentes para ser
removida. Essa decisão é tomada por um algoritmo de substituição de páginas,
cujo objetivo é minimizar a ocorrência de faltas de página e melhorar o
desempenho geral do sistema.

O algoritmo Segunda Chance (Second Chance) é uma variação do algoritmo FIFO
(First In, First Out). Assim como no FIFO, as páginas são organizadas em uma
fila de acordo com a ordem em que foram carregadas na memória. Entretanto,
antes de remover uma página, o algoritmo verifica seu bit de referência (R).

Quando uma página chega à frente da fila, seu bit R é analisado. Se R = 0,
a página é escolhida para substituição. Caso contrário, se R = 1, a página
recebe uma segunda chance: seu bit R é zerado e ela é movida para o final
da fila, adiando sua remoção. O processo continua até que seja encontrada
uma página cujo bit R seja igual a 0.

Nesta atividade, será apresentado o estado atual da fila de páginas residentes
na memória, juntamente com o valor do bit de referência (R) de cada uma delas.
Seu objetivo é determinar qual página será substituída após a ocorrência de uma
falta de página, utilizando o algoritmo Segunda Chance.