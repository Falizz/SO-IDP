Nesta atividade, você deverá escrever um código em assembly x86-64
que chame uma função cujo o valor do endereço encontra-se no
seguinte endereço: 0x404220
Este endereço é um ponteiro que aponta para a função que você deve chamar.
Já a função recebe três parâmetros:
 - Parametro 01: 1962583
 - Parametro 02: G
 - Parametro 03: y
Caso os parâemtros estejam corretos, a função irá imprimir o conteúdo do
arquivo /desafio/recompensa.txt.


O endereço da função é fixo e não muda entre execuções. Além disso, seu código
será colocado na seguinte região de memória fixa: 0x424242000