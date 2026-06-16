# Descrição

Side-channel attacks são técnicas que extraem informação sensíveis mas
observando efeitos ou sinais colaterais do comportamento de um sistema (tempos
de execução, consumo de energia, emissões eletromagnéticas, uso de cache, etc.).
Nesta atividade, você irá explorar um outro tipo de canal lateral em caches,
chamado de Flush+Reload.

Esse tipo de ataque tem suporte em apenas duas propriedades bem simples:

 - 1: existe uma instrução capaz de limpar linhas de cache (flush); e
 - 2: existe uma instrução capaz de medir o tempo de execução com alta resolução (reload).

Se atacante e vítima compartilham uma mesma região de memória, então a vítima
pode, ao acessar essa região, recarregar dados no cache; a partir disso, o
atacante mede o tempo de um acesso à mesma linha e um acesso rápido indica cache
hit (portanto a vítima provavelmente acessou a linha); ou um acesso lento indica
cache miss (a vítima provavelmente não acessou).

Nesta atividade, você irá explorar exatamente esse cenário. Há um fonte chamado
desafio.c que contém a lógica do programa compilado, chamado exercicio. Esse
programa simula um cenário em que uma vítima vota secretamente em um de dois
candidatos (A ou B) e você, como atacante, deve descobrir em quem cada vítima
votou.

Para isso, há um buffer mapeado em memória (buffer) onde duas posições
específicas representam votos_a e votos_b (cada uma localizada em linhas de
cache diferentes). Há também uma função votar que, dependendo de
"aleatoriedade", acrescenta 1 voto a um dos candidatos (A ou B).

Entre cada voto computado, você terá acesso a um menu interativo que permite
executar sequências de operações para monitorar e inspecionar o comportamento da
vítima, o qual você deve explorar para descobrir os votos computados.

Um detalhe de implmentação é que as operações medidas são repetidas várias vezes
(número de samples = 10) para facilitar a medição de tempos e reduzir ruídos.

Assim que todos os votos forem computados, o programa irá questionar o resultado
da votação (número de votos para A e B) e você deve informar os valores corretos,
para receber a resposta para a atividade.

Sugestão de Leitura: https://eprint.iacr.org/2013/448.pdf