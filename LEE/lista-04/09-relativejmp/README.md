- Saltos Relativos

Nesta atividade, você deverá escrever um código que realize um salto relativo
em relação a um endereço específico.

Você deverá executar o seguinte:

- A primeira instrução do seu código deverá ser um jmp
- Esse salto deverá ser feito para o deslocamento de 0x48 bytes
  em relação ao endereço da instrução atual
- Na posição de destino, você deverá escrever uma instrução para mover o valor
  0xb8130267 para o registrador rdi.

Nesta atividade, o seu código será armazenado no seguinte endereço: - 0x4000da

Dica: como será necessário escrever bastante código entre o salto inicial e a
última instrução de código o x86 possui um conjunto de diretivas ou
pseudo-instruções que podem auxiliar na solução da atividade. A pseudo-instrução
.rept serve para repetir uma determina instrução um número N de vezes. A sintaxe
é a seguinte:

.rept N; <INSTRUCAO>; .endr;

Dessa forma, para facilitar a inclusão de instruções que não serão utilizadas,
você pode optar por alguma instrução simplificada que não será executada, para
facilitar o preenchimento do offset. Um guia completo de diretivas pode ser
consultado em:
https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC116
