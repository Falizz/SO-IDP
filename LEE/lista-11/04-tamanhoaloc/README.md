# Descrição

O gerenciador de memória da libc é responsável por fornecer funções para
alocação e liberação dinâmica de memória em programas C. Ele gerencia um heap
privado do processo, atendendo solicitações de memória de diferentes tamanhos e
reutilizando blocos liberados para otimizar o uso do espaço.

Nos códigos em C, ao utilizar alocação dinâmica, nem sempre o tamanho informado
pelo usuário é o mesmo que o tamanho alocado. Isso ocorre porque o gerenciador
de memória precisa, além do espaço solicitado, armazenar informações adicionais
sobre o bloco alocado, além de manter um alinhamento adequado para garantir
acesso eficiente à memória.

Nesta atividade, estamos interessados especificamente no tamanho real diponível
para uso após a alocação de memória, que é o objetivo desta atividade. Assim,
na pasta /desafio, há um arquivo chamado codigo.c, que realiza uma alocação
de memória, o qual você deverá investigar e responder ao validador, programa
também na pasta /desafio, o tamanho real alocado em bytes.