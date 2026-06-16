# Descrição

A heap possui um espaço de endereçamentos específico nos mapeamentos de memória
de um processo, que é solicitado ao Sistema Operacional após a execução da
primeira alocação feita pelo programa em execução. Sucessivas alocações, mesmo
de tamanhos diferentes são organizadas nesse mesmo espaço citado.

Nesta atividade, há um arquivo chamado desafio.c que possui o código do programa
chamado desafio. Durante a sua execução, este realiza duas alocações de mesmo
tamanho a qual o conteúdo do arquivo password.txt é copiado para a segunda
alocação. De posse das informações referentes às alocações feitas pelo programa,
você poderá realizar uma escrita de tamanho arbitrário na primeira alocação.

A resposta para a atividade é o conteúdo do arquivo password.txt