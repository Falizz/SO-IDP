# Descrição

A heap possui um espaço de endereçamentos específico nos mapeamentos de memória
de um processo, que é solicitado ao Sistema Operacional após a execução da
primeira alocação feita pelo programa em execução. Sucessivas alocações, mesmo
de tamanhos diferentes são organizadas nesse mesmo espaço citado.

Nesta atividade, há um arquivo chamado desafio.c que possui o código do programa
chamado desafio. Durante a sua execução, ele permite que sejam feitas diversas
operações por escolha do usuário, envolvendo alocação e liberação de memória.
Dentre essas operações, uma delas carrega o conteúdo do arquivo password.txt
para uma das alocações, a qual não pode ser acessada pelo usuário diretamente,
porém é possível tirar proveito do gerenciador de memórias livres (ptmalloc2)
para acessar o conteúdo, que é o objetivo desta atividade.