# Descrição

PIE (Position Independent Executable) é um tipo de executável que pode ser
carregado em qualquer posição da memória, independentemente de um endereço fixo.
Ele é construído com instruções que realizam acesso a código e dados de forma
relativa, calculando os endereços em tempo de execução a partir da posição base
onde o binário foi carregado.

Quando um programa é compilado com PIE (opção padrão), o loader do sistema
escolhe dinamicamente onde posicioná-lo na memória, e as referências internas
são ajustadas automaticamente, permitindo que o código execute corretamente
mesmo com essa aleatoriedade.

Para testar essa ideia, o gcc possui a flag `-no-pie`, então há um código
chamado `exemplo.c` que possui uma função chamada `funcao`. O programa
basicamente imprime o endereço dessa função, então para observar o comportamento
da existência do PIE, compile e execute o programa de duas formas:

1 - Compilação sem PIE
  1. Compilação
     gcc -o programa -no-pie exemplo.c
  2. Execução
     Execute o programa múltiplas vezes, e você perceberá que o endereço da
     função não mudará

2 - Compilação com PIE
  1. Compilação
     gcc -o programa exemplo.c
  2. Execução
     Execute o programa múltiplas vezes, e você perceberá que o endereço será
     "sempre" diferente

Quando um binário é compilado sem PIE, ele é construído com endereços absolutos.
Isso significa que todas as instruções que referenciam funções, variáveis
globais ou dados são associadas a endereços fixos determinados no momento da
linkagem. O binário espera ser carregado sempre na mesma posição na memória, que
é predefinida e constante.

Consequências desse modelo:

O sistema operacional carrega o binário em um endereço fixo, geralmente
especificado pela configuração padrão do ligador, que é 0x400000 (lembra dos
exercícios em assembly? A maioria era montado com esse mesmo endereço como
referência).

Como os endereços são conhecidos de antemão, o binário é mais suscetível a
ataques que exploram esse conhecimento, como buffer overflows, que podem
sobrescrever endereços críticos.

Em sistemas modernos, muitos compiladores e distribuições optam por habilitar
PIE por padrão justamente para evitar essas vulnerabilidades associadas ao uso
de endereços fixos.

Nesta atividade, além do código de exemplo, há um programa chamado `atividade`,
que foi compilado sem PIE. Sua tarefa é coletar o endereço da função `funcao`,
e responder ao `validador` da atividade, tudo na pasta `/desafio`.