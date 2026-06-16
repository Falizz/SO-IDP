# Descrição

Depois de entender o PIE, fica mais fácil compreender como o sistema operacional
pode aplicar a ideia de randomização na memória, e como programas compilados com
PIE podem ser carregados em qualquer posição da memória do computador. A partir
dessa possibilidade, o SO tem a capacidade de reorganizar dinamicamente a
disposição dos diversos componentes de um processo na memória a cada execução. E
é exatamente o que ele faz utilizando ASLR (Address Space Layout Randomization).

O ASLR é uma técnica de segurança que randomiza a posição de elementos
importantes na memória como:

- O endereço base do binário;
- A localização das bibliotecas compartilhadas;
- A heap (memória dinâmica); e
- A pilha (stack).

Sem PIE, os executáveis possuem endereços fixos e, portanto, o ASLR não consegue
relocar o código do programa principal, reduzindo sua eficácia. Já com PIE, o
executável se comporta como uma biblioteca, podendo ser carregado em diferentes
posições a cada execução, o que potencializa a proteção oferecida pelo ASLR.

Essa aleatorização aumenta a dificuldade para que um atacante consiga prever
onde, na memória, estão localizadas funções que se poderia tentar corromper ou
explorar, como em ataques de buffer overflow.

Cabe ressaltar que, dentro de um mesmo segmento, endereços de funções, variáveis
e espaços continuam possuindo a mesma distância, adicionando-se a esses
deslocamentos apenas um valor aleatório que passa a fazer parte de todos os
endereços a partir do terceiro nibble.

Assim, ASLR e PIE são técnicas complementares em sistemas modernos, e amplamente
implementadas em sistemas como Linux, Windows e macOS.

Nesta atividade, há um programa chamado `exercicio`, o qual o código utilziado
para gerar o seu conteúdo está no arquivo `codigo.c`. Esse binário imprime o
endereço da função `main` (experimente executar múltiplas vezes) e também o
endereço do canário (muito legal esse professor), os quais você poderá utilizar
para tirar vantagem da execução desse programa.