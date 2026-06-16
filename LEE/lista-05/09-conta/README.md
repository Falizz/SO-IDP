- Conta Bytes

Nesta atividade, você deverá escrever um programa que faça o seguinte:

- Conte o número de bytes consecutivos não nulos a partir do endereço de
  memória fornecido pelo registrador rdi e armazene o resultado no registrador
  rax.
- Caso o valor de rdi seja 0, o programa deve armazenar 0 em rax.

O seu programa passará por uma série de casos de teste, um exemplo de caso de testes
é o seguinte:
rdi = 0x400000
memória[0x400000] = 0x41 ('A')
memória[0x400001] = 0x42 ('B')
memória[0x400002] = 0x00 (byte nulo)
memória[0x400003] = 0x43 ('C')

A resposta esperada para este caso de teste é 2.
