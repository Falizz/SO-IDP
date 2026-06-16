# Exercício: Stack Push

Sem utilizar as instruções de manipulação direta da pilha (**PUSH** e **POP**), faça o seguinte:

- Insira o valor presente no registrador **rdi** no topo da pilha;
- Ajuste o registrador **RSP** para que a pilha aponte para o novo topo da pilha.

---

### Visualização da Pilha

| Antes                   | Depois                  |
| :---------------------- | :---------------------- | ------- | ------- | --- | ------- |
|                         | `+-------------------+` |
|                         | `                       | B       | <- RSP` |
| `+-------------------+` | `+-------------------+` |
| `                       | A                       | <- RSP` | `       | A   | `       |
| `+-------------------+` | `+-------------------+` |
| `                       |                         | `       | `       |     | `       |
| `                       |                         | `       | `       |     | `       |
| `                       |                         | <- RBP` | `       |     | <- RBP` |
| `+-------------------+` | `+-------------------+` |

---

### Valores Inicializados

- **(pilha) [0x7fffff1fffea]** = `0x25f9442982c9e3a0` (Topo da pilha atual)
- **(pilha) [0x7fffff1ffff2]** = `0xeabc2c5a800b79af` (Próximo valor da pilha)
- **rdi** = `0x6ea31c0c57f17279`

---

### Implementação Sugerida

Para simular o `push rdi`, primeiro subtraímos 8 bytes do `RSP` (já que a pilha cresce para endereços menores) e depois movemos o valor para a nova posição.

```assembly
; Decrementa o ponteiro da pilha em 8 bytes para abrir espaço
sub rsp, 8

; Move o valor de rdi para a nova posição apontada por RSP
mov [rsp], rdi
```
