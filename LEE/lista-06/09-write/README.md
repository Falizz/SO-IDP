 - Chamanda da Syscall Write -

Nesta atividade, você deverá escrever um código em assembly x86-64
que chame a syscall write para imprimir o conteúdo
que foi lido do arquivo /desafio/recompensa.txt. Esse conteúdo
encontra-se no seguinte endereço:

 - 0x4045e0

Para utilizar a syscall write, lembre-se de colocar no
registrador RDI o descritor da saída que pretente utilizar,
no registrador RSI o endereço do buffer de escrita e no registrador
RDX o tamanho do buffer. Para esta atividade, o seu payload não
poderá exceder 40 bytes.

O seu payload será colocado na seguinte região de memória fixa:

 - 0x42424200