- Condicionais Aninhadas

Utilizando estruturas condicionais, implemente o seguinte:

```
if [x] == 0x7f45cafe:
    y = [x+4] + [x+8] + [x+12]
else if [x] == 0x00005AAD:
    y = [x+4] - [x+8] - [x+12]
else:
    y = [x+4] * [x+8] * [x+12]
```

onde:
x = r13
y = rax

Assuma que cada valor é um inteiro de 32 bits com sinal. Ou seja,
os valores podem começar negativos em cada posição de memória.

Nesta atividade, serão executados múltiplos casos de testes. Aqui está um
exemplo:

(data) [0x404000] = {4 random dwords]}
r13 = 0x404000

Obs: Lembre-se de não deixar o seu programa executar trechos de código que
seriam pertencentes a um fluxo diferente do condicional testado, que é um
erro comum em códigos assembly.
