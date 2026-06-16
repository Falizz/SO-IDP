# Exercício: Stack Swap

Sem utilizar as instruções de manipulação direta da pilha (**PUSH** e **POP**), faça o seguinte:

- Troque os valores do topo da pilha entre si.

---

### Visualização da Pilha

| Antes                   | Depois                  |
| :---------------------- | :---------------------- | ------- | --- | --- | ------- |
| `+-------------------+` | `+-------------------+` |
| `                       | A                       | <- RSP` | `   | B   | <- RSP` |
| `+-------------------+` | `+-------------------+` |
| `                       | B                       | `       | `   | A   | `       |
| `+-------------------+` | `+-------------------+` |
| `                       |                         | `       | `   |     | `       |
| `                       |                         | `       | `   |     | `       |
| `                       |                         | <- RBP` | `   |     | <- RBP` |
| `+-------------------+` | `+-------------------+` |

---

### Valores Inicializados

- **(pilha) [0x7fffff1fffea]** = `0x6859ecf892b67997` (Topo da pilha - Valor A)
- **(pilha) [0x7fffff1ffff2]** = `0x1d0b8e318a1986df` (Próximo valor - Valor B)

---
