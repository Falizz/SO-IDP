# Exercício: Stack Pop

Sem utilizar as instruções de manipulação direta da pilha (**PUSH** e **POP**), faça o seguinte:

- Retire o valor presente no topo da pilha;
- Armazene-o no registrador **r8**;
- Ajuste o registrador **RSP** para que a pilha aponte para o próximo valor da pilha.

---

### Visualização da Pilha

| Antes                   | Depois                  |
| :---------------------- | :---------------------- | ------- | ----------------------- | --- | ------- |
| `+-------------------+` |                         |
| `                       | A                       | <- RSP` | `+-------------------+` |
| `+-------------------+` | `                       | B       | <- RSP`                 |
| `                       | B                       | `       | `+-------------------+` |
| `+-------------------+` | `                       |         | `                       |
| `                       |                         | `       | `                       |     | `       |
| `                       |                         | <- RBP` | `                       |     | <- RBP` |
| `+-------------------+` | `+-------------------+` |

---

### Valores Inicializados

- **(pilha) [0x7fffff1fffea]** = `0xdad9358ba8680698` (Topo da pilha)
- **(pilha) [0x7fffff1ffff2]** = `0xb7fed3db45d6f865` (Próximo valor)
- **r8** = `0xa7045fd720ffb635`

---

### Implementação Sugerida

```assembly
; Move o valor do topo da pilha para o registrador r8
mov r8, [rsp]

; Incrementa o ponteiro da pilha para apontar para o próximo elemento (8 bytes)
add rsp, 8
```
