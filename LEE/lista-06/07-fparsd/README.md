Nesta atividade, você deverá escrever um código em assembly x86-64
que chame uma função cujo o valor do endereço encontra-se no
seguinte endereço: 0x404438
Este endereço é um ponteiro que aponta para a função que você deve chamar.
Já a função recebe três parâmetros:
 - Parametro 01: 8038449
 - Parametro 02: A
 - Parametro 03: 622.426
Repare que o terceiro parâmetro é um número de ponto flutuante com precisão dupla.
Nesse caso, o registrador o qual deverá receber esse parâmetro é o xmm0
(seja bem-vindo novo registrador).
Pesquise sobre ele e como ele é utilizado. Se precisar de uma região de memória
Lembre-se que após a sua chamada de função, nada mais é executado.
Caso os parâmetros estejam corretos, a função irá imprimir o conteúdo do
arquivo /desafio/recompensa.txt.


O endereço da função é fixo e não muda entre execuções. Além disso, seu código
será colocado na seguinte região de memória fixa: 0x424242000