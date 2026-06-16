# Descrição

Um bloco é uma unidade de transferência de dados entre a memória principal e
outros componentes, como a cache. Ele consiste em um conjunto contíguo de
palavras de memória, sendo o tamanho do bloco determinado pela arquitetura do
sistema. O uso de blocos permite otimizar o acesso à memória, reduzindo o número
de transferências necessárias.

Já Uma palavra é a menor unidade de dados que pode ser endereçada e manipulada
de forma independente pela CPU. O tamanho de uma palavra depende da arquitetura
do processador (por exemplo, 32 ou 64 bits) e determina a quantidade de dados
que podem ser processados em uma única operação.

Nesta, há um arquivo chamado `exercicio`, dentro da pasta `/desafio`, que irá
solicitar a quantidade de blocos de uma memória de algumas configurações
diferentes.