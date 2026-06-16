# Documentação Técnica: Algoritmo de Substituição de Páginas LRU (Least Recently Used) e Aging

## 1. Introdução ao LRU Teórico
O algoritmo **LRU (Menos Recentemente Utilizado)** baseia-se no princípio da localidade temporal: páginas que foram amplamente utilizadas no passado recente têm uma grande probabilidade de serem utilizadas novamente no futuro próximo. Da mesma forma, páginas que não são acedidas há muito tempo provavelmente continuarão sem uso.

Quando ocorre uma falta de página (*page fault*), o LRU teórico escolhe para substituição a página que está **há mais tempo consecutiva sem receber nenhum tipo de acesso**.



### O Problema da Implementação Teórica
Embora o LRU teórico seja excelente e apresente taxas de *page fault* muito baixas, a sua implementação exata em sistemas reais é **inviável**. Para identificar com precisão cirúrgica qual página é a mais antiga sem uso, o sistema precisaria de:
1. Manter uma lista duplamente encadeada de todas as páginas em memória e movê-las para a frente a *cada* acesso de memória, ou
2. Equipar o hardware com um contador de ciclos de clock que carimbasse cada acesso na tabela de páginas.

Ambas as abordagens geram um custo de processamento (*overhead*) proibitivo para cada instrução executada pela CPU.

---

## 2. A Solução Prática: O Algoritmo de Envelhecimento (Aging)
Para colher os benefícios do LRU sem destruir o desempenho do sistema, os Sistemas Operacionais utilizam uma aproximação em software conhecida como **Algoritmo de Envelhecimento (Aging)**.

Em vez de monitorizar cada instrução individualmente, o Aging colhe dados periodicamente através de **interrupções de relógio (timer interrupts)**, utilizando estruturas de contadores digitais de tamanho fixo (geralmente de 8 bits) associados a cada página.

---

### 3. Funcionamento Passo a Passo do Aging
Para cada página residente na memória física, o sistema mantém:
* Um **Bit R (Referenced)**: Controlado pelo hardware, vira `1` sempre que a página é acedida.
* Um **Contador de Software**: Um registo numérico (ex: 8 bits, inicializado em `00000000`).

A cada interrupção periódica do relógio (ciclo de atualização), o Sistema Operacional executa a seguinte rotina para **todas** as páginas em memória:

1.  **Deslocamento à Direita (Shift Right):** O contador da página é deslocado 1 bit para a direita. O bit menos significativo (à direita) é descartado.
2.  **Inserção do Histórico Recente:** O valor atual do **Bit R** é injetado na posição do bit mais significativo (o bit mais à esquerda, MSB).
3.  **Reset de Hardware:** O **Bit R** é zerado (`0`) para começar a recolha de dados do próximo ciclo de tempo.



#### Exemplo Visual de Atualização de um Contador (8 bits):
* Contador inicial: `01101100`
* No período atual, a página foi acedida pelo processo ($R = 1$).
* **Ação:** Desloca para a direita $\rightarrow$ `_0110110` $\rightarrow$ Injeta $R=1$ à esquerda $\rightarrow$ Novo Contador: `10110110`.

---

## 4. O Critério de Substituição
Quando a memória fica cheia e um *page fault* obriga o sistema a remover uma página:

1. O sistema examina os contadores de todas as páginas residentes no momento atual.
2. O contador é interpretado como um **valor numérico inteiro sem sinal**.
3. A página que possuir o **menor valor numérico** no contador é selecionada como a candidata à substituição.

**Por que o menor valor?** * Um bit `1` posicionado mais à esquerda indica um acesso muito recente. 
* Um bit `1` que foi deslocado muito para a direita indica um acesso que ocorreu há muitos ciclos de relógio atrás.
* Portanto, quanto menor o valor numérico do contador, há mais tempo a página está sem ser acedida de forma ativa.

---

## 5. Diferença entre LRU Teórico e Aging

Embora o Aging simule perfeitamente o LRU na maioria dos cenários, ele possui duas limitações técnicas que o impedem de ser idêntico ao LRU puro:

1.  **Esquecimento de Passado Distante:** Devido ao tamanho finito do contador (ex: 8 bits), qualquer acesso que tenha ocorrido há mais de 8 ciclos de relógio é completamente descartado pelo deslocamento para a direita. O sistema não consegue distinguir o histórico de duas páginas que não são acedidas há 9 ou 12 ciclos.
2.  **Falta de Precisão Intra-Ciclo (Empates):** Se duas páginas foram acedidas dentro do mesmo ciclo de relógio (ambas com $R=1$), os seus contadores receberão o bit `1` na mesma posição. O Aging não sabe qual delas foi acedida milissegundos antes da outra dentro daquele bloco de tempo. Havendo empate de menor valor, a escolha é aleatória.

---

## 6. Vantagens e Desvantagens do Aging

### Vantagens
* **Excelente Custo-Benefício:** Executa apenas operações binárias rápidas (`shift` e `OR`) e apenas durante as interrupções de relógio, não pesando nas instruções normais do processador.
* **Alta Eficiência:** Na prática, apresenta resultados de paginação extremamente próximos e satisfatórios quando comparados com o LRU ideal.

### Desvantagens
* **Gasto de Memória Adicional:** Requer a manutenção de tabelas com contadores em software para cada página ativa.
* **Sensibilidade ao Intervalo do Relógio:** Se o relógio bater muito rápido, consome CPU excessiva. Se bater muito devagar, o sistema perde a noção de granularidade temporal do que é "recente".