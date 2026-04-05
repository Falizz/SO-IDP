- Saltos Absolutos

Em x86, existem duas maneiras principais de controlar o fluxo de um programa:

- Saltos
- Chamadas de função

Falando inicialmente sobre saltos, existem dois tipos principais:

- Saltos Relativos
- Saltos Absolutos

Saltos incondicionais são instruções que fazem com que o fluxo de execução do
programa mude para outro local, alterando o valor do registrador RIP. Saltos
podem ser realizados de três maneiras difentes:

- 1: Saltos Relativos - Saltos que são relativos ao endereço atual
- 2: Saltos Absolutos - Saltos que são absolutos, ou seja, o endereço de
  destino
- 3: Saltos Indiretos - Saltos que são realizados para um endereço contido em
  um registrador

No caso de saltos absolutos, que se referem a um endereço específico, deve-se
primeiro colocar o endereço de destino em um registrador e então realizar o
salto. A instrução `jmp` é utilizada para realizar saltos absolutos.

Nesta atividade, o seu código será armazenado no seguinte endereço: - 0x4000a2

E você deverá realizar um salto absoluto para o seguinte endereço: - 0x403000

Instruções permitidas: - JMP - MOV
