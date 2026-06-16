# Descrição

O gerenciador de heap utilizado pela glibc (ptmalloc2) mantém estruturas
internas responsáveis por rastrear regiões de memória alocadas e liberadas
durante a execução de um processo. Durante operações de liberação (free),
verificações de consistência são realizadas para impedir que um mesmo bloco de
memória seja inserido múltiplas vezes nas listas de chunks livres, situação
conhecida como double free. Quando este é detectado, o alocador considera que o
estado interno da heap foi corrompido e interrompe imediatamente a execução do
processo através de um abort, evitando comportamentos indefinidos e possíveis
explorações da heap.

Nesta atividade, há um arquivo chamado desafio.c que possui o código do programa
chamado desafio. Durante a sua execução, ele permite que sejam feitas diversas
operações por escolha do usuário, envolvendo alocação, leitura, escrita e
liberação de memória dinâmica. Seu objetivo é provocar a detecção de um double
free durante a execução do programa.