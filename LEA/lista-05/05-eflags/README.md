- Registrador EFLAGS

O registrador EFLAGS é um dos registradores de controle do processador.
Ele contém informações sobre o estado do processador e o resultado de
operações aritméticas e lógicas. O EFLAGS é composto por várias flags,
cada uma com uma função específica. Algumas das flags mais importantes
são:

- ZF (Zero Flag): Indica se o resultado de uma operação aritmética ou lógica
  foi zero. Se o resultado for zero, o ZF é definido como 1; caso contrário,
  ele é definido como 0.
- SF (Sign Flag): Indica o sinal do resultado de uma operação aritmética ou
  lógica. Se o resultado for negativo, o SF é definido como 1; caso contrário,
  ele é definido como 0.
- OF (Overflow Flag): Indica se ocorreu um estouro em uma operação aritmética
  com sinal. Se o resultado exceder o intervalo representável, o OF é
  definido como 1; caso contrário, ele é definido como 0.
- CF (Carry Flag): Indica se ocorreu um transporte em uma operação aritmética
  sem sinal. Se houver um transporte, o CF é definido como 1; caso contrário,
  ele é definido como 0.
- etc

O registrador EFLAGS é utilizado para controlar o fluxo de execução do programa,
especialmente em operações condicionais.

Nesta atividade, você deverá escrever um código em assembly que contenha uma
operação que afete a flag Carry Flag (CF) do registrador EFLAGS.

Valores inicializados:

- EFLAGS: 00000000000000000000000000000010

- Restrições:
  - Se precisar, você pode utilizar os registradores rcx e rdx
  - Você poderá utilzar até 02 instruções

Observação: no registrador EFLAGS, o bit da posição 1 é reservado e possui valor
sempre 1.
