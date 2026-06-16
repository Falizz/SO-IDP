# Descrição

Agora que você já tem a noção do perigo na sobreposição de conteúdos causada por
buffer overflow, imagine que é possível sobrescrever esse com algo que irá
atrapalhar o comportamento final do programa. Observe o seguinte cenário:

 [            buffer             ] [  valor RBP salvo ] [ endereço de retorno ]
 |             32B               | |        8B        | |        8B           |

O que aconteceria se você sobrescrevesse o endereço de retorno com um outro
endereço válido? Esse é o seu objetivo para esta atividade. Você deverá coletar
o endereço da função chamada `objetivo` no programa, e sobrescrever o endereço
de retorno da função `vulneravel` com este endereço.

Nesta atividade, há um programa chamado `exercicio`, o qual o código utilziado
para gerar o seu conteúdo está no arquivo `codigo.c`.