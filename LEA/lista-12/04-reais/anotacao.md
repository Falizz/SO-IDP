# Notas de Estudo: Cálculo de Endereço Físico na Memória Virtual

Este documento registra a metodologia utilizada para calcular o endereço físico real a partir de um endereço virtual com base no mecanismo de paginação de Sistemas Operacionais.

---

### 1. Parâmetros do Sistema Analisado

* **Tamanho da Página/Frame:** $4\text{ KB} = 4096\text{ bytes}$
* **Endereço Virtual Consultado:** `38429`

---

### 2. Algoritmo de Resolução Passo a Passo

O processo de tradução de um endereço lógico (virtual) para um endereço real (físico) divide-se em três etapas principais:

#### Passo 1: Determinar o Número da Página e o Deslocamento (*Offset*)
Qualquer endereço virtual é composto por: `[Número da Página (N)][Deslocamento (Offset)]`.

1. **Número da Página ($N$):** Divide-se o endereço virtual pelo tamanho da página, ignorando as casas decimais (divisão inteira).
   $$N = \lfloor 38429 / 4096 \rfloor = \lfloor 9,38208 \rfloor = 9$$

2. **Deslocamento (*Offset*):** É o resto da divisão do endereço virtual pelo tamanho da página (posição exata do byte dentro daquele bloco).
   $$\text{Offset} = 38429 \pmod{4096} = 38429 - (9 \times 4096) = 1565$$

*Dica de Validação por Intervalo:* O endereço $38429$ situa-se entre $36\text{ KB}$ ($36 \times 1024 = 3686