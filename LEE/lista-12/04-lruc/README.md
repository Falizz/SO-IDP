# Descrição

Quando a memória principal está cheia e uma nova página precisa ser carregada, o
Sistema Operacional precisa escolher uma das páginas residentes para ser
removida. Essa decisão é tomada por um algoritmo de substituição de páginas.

O Algoritmo de Envelhecimento (Aging) é uma aproximação do algoritmo LRU (Least
Recently Used). Para cada página, o sistema mantém um contador e um bit de
referência (R), que indica se a página foi acessada desde a última interrupção
de relógio.

A cada interrupção de relógio, os contadores são atualizados da seguinte forma:

1. O contador é deslocado um bit para a direita.
2. O valor do bit R é inserido no bit mais significativo do contador.
3. O bit R é zerado.

Nesta atividade, será apresentado o estado atual dos contadores das páginas
residentes na memória, bem como os ciclos de atualização das páginas que de
alguma substituição.

Seu objetivo é aplicar todos os ciclos de atualização apresentados e determinar
qual página será candidata à substituição ao final do processo.

Observação: Em caso de empate, qualquer uma das páginas empatadas pode ser
informada como resposta.