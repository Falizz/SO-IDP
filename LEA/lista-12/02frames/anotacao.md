# Notas de Estudo: Arquitetura de Sistemas Operacionais
## Gerenciamento de Memória Virtual e Paginamento

Este documento registra as resoluções e a estrutura lógica dos exercícios práticos sobre o mapeamento de **Memória Virtual** para **Memória Física** utilizando tabelas de páginas e frames.

---

### 1. Conceitos Fundamentais

* **Memória Virtual:** Uma abstração que permite a cada processo simular a posse exclusiva da memória total do sistema, isolando os espaços de endereçamento.
* **Página (Page):** Bloco de tamanho fixo em que a memória virtual é dividida.
* **Frame (Quadro):** Bloco de tamanho fixo em que a memória física (RAM) é dividida. O tamanho do frame é sempre estritamente igual ao tamanho da página.
* **Page Fault (Falta de Página):** Evento gerado pelo hardware (MMU) quando um processo tenta aceder a uma página lógica que não está atualmente carregada em nenhum frame da memória física (sinalizada por `X` nas tabelas).

---

### 2. Parâmetros do Sistema Analisado

* **Tamanho da Página/Frame:** 4 KB (4096 bytes)
* **Número de Páginas Lógicas:** 12 (Índices de 0 a 11)
* **Número de Frames Físicos:** 8 (Índices de 0 a 7)

#### Fórmula de Mapeamento de Endereço para Número de Página:
$$\text{Número da Página} = \lfloor\text{Endereço Virtual} / \text{Tamanho da Página}\rfloor$$

---

### 3. Tabela de Mapeamento Completa (Resolução dos Casos)

Abaixo está o mapeamento consolidado correlacionando o **Intervalo de Endereço Virtual**, o **Número da Página Lógica** correspondente e o **Frame Físico** associado com base no histórico de consultas realizadas:

| Número da Página | Intervalo Virtual | Frame Associado | Status / Resultado da Consulta |
| :---: | :---: | :---: | :--- |
| **Página 11** | 44K-47K | `X` | **-1** (Page Fault — *Consultado nos Casos 1 e 2*) |
| **Página 10** | 40K-43K | `2` | **Frame 2** (*Consultado no Caso 4*) |
| **Página 9** | 36K-39K | `5` | Frame 5 |
| **Página 8** | 32K-35K | `7` | Frame 7 |
| **Página 7** | 28K-31K | `X` | Page Fault (`-1`) |
| **Página 6** | 24K-27K | `3` | **Frame 3** (*Consultado no Caso 3*) |
| **Página 5** | 20K-23K | `4` | Frame 4 |
| **Página 4** | 16K-19K | `0` | Frame 0 |
| **Página 3** | 12K-15K | `X` | Page Fault (`-1`) |
| **Página 2** | 8K-11K | `3` | Frame 3 |
| **Página 1** | 4K-7K | `6` | Frame 6 |
| **Página 0** | 0K-3K | `X` | Page Fault (`-1`) |

*Nota: Os mapeamentos de frames acima utilizam como referência a última disposição de estado do sistema fornecida.*

---

### 4. Algoritmo de Resolução Passo a Passo

Para determinar o frame a partir de um número de página $N$:
1. Localize a linha correspondente à **Página $N$** na Tabela de Páginas (contando de baixo para cima a partir do $0$, ou calculando o intervalo através de $N \times 4\text{K}$ até $(N+1)\text{K} - 1$).
2. Verifique o valor contido na coluna **Frame**:
   * Se o valor for numérico (ex: `2`, `3`), a página está mapeada. **Retorne o número do frame**.
   * Se o valor for `X`, a página não está na memória física. **Retorne `-1` (Page Fault)**.