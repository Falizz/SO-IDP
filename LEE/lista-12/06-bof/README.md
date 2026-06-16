# Descrição

Um buffer overflow ocorre quando um programa escreve mais dados em uma região de
memória (um buffer) do que ela pode armazenar. Como a memória de um programa é
organizada de forma sequencial, ao ultrapassar o limite do buffer, os dados
acabam sobrescrevendo outras áreas importantes da memória, como variáveis
adjacentes, endereços de retorno ou até instruções do programa. Esse tipo de
falha pode ser explorado por atacantes para alterar o comportamento do programa,
desviar o fluxo de execução ou executar código malicioso.

Por exemplo, considere um buffer com capacidade para 8 bytes, mas o programa
permite que sejam escritos 16 bytes:

 [    buffer    ] [ outra variável ] [   RBP salvo    ] [ endereço de retorno ]
 |      8B      | |       XB       | |       8B       | |         8B          |

Nesse caso, os primeiros 8 bytes preenchem o buffer, mas os 8 bytes extras
acabam invadindo e modificando outras variáveis, a base da pilha (RBP) salva da
função chamadora, e até o endereço de retorno também dessa função chamadora, que
controla para onde o programa vai após terminar a função chamada. Isso pode
levar o programa a executar "crashar" ou realizar comportamentos não desejados.

Nesta atividade, há um programa chamado `exercicio`, o qual o código utilziado
para gerar o seu conteúdo está no arquivo `codigo.c`, seu objetivo é provocar
um buffer overflow na execução desse programa.