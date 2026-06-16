 - Ler Memória -

Nesta atividade, você deverá escrever um código em assembly x86-64
para ler o conteúdo da memória contida no endereço 0x554488ef9000
Em algum local desta região de memória consta o conteúdo do arquivo
/desafio/recompensa.txt, que é a resposta para a atividade.
Por último, você poderá utilizar somente as seguintes syscalls:
 - read
 - write
 - exit
Para esta atividade, o seu payload não poderá exceder 256 bytes.

O seu payload será colocado na seguinte região de memória fixa (rwx):

- 0x424242000