# Lista de Revisão 13 - Sistemas Operacionais (Gabarito Oficial)

Este arquivo contém o compilado de questões corrigidas e validadas 100% de acordo com o gabarito oficial e critérios do professor.

---

## 1. Algoritmos de Gerenciamento de Memória Livre (Lista Encadeada)

**Questão:** Relacione o algoritmo de gerenciamento de memória livre, utilizando lista encadeada, de acordo com o seu princípio de funcionamento.

### Mapeamento Oficial:
* **Quick Fit:** Utiliza uma lista de espaços livres para reaproveitamento (mantém listas separadas para os tamanhos mais comuns solicitados).
* **First Fit:** Percorre a lista até encontrar o primeiro espaço grande o suficiente (menor busca).
* **Next Fit:** Encontra a primeira ocorrência onde é possível disponibilizar a memória, grava, disponibiliza e realiza buscas seguintes a partir da posição gravada.
* **Best Fit:** Varre toda a lista e devolve o menor espaço possível.
* **Worst Fit:** Varre toda a lista e devolve o maior espaço possível.

---

## 2. Funções do Gerenciador de Memória

**Questão:** Selecione quais das alternativas são funções do Gerenciador de Memória.

### Alternativas Corretas:
* **a.** Alocar memórias solicitadas por processos
* **b.** Liberar a memória de processos que terminaram
* **e.** Controlar partes da memória que estão sendo utilizadas

> **Atenção:** A alternativa *"Traduzir endereços virtuais em endereços de alocação"* foi considerada incorreta pelo gabarito oficial por ser uma atribuição estrita do hardware (**MMU**).

---

## 3. Assertivas sobre Gerenciamento de Memória

**Questão:** Assinale as assertivas verdadeiras sobre Gerenciamento de Memória.

### Alternativas Verdadeiras (Gabarito Oficial):
* **b.** No gerenciamento de memória livre por lista encadeada, os nós, que são intervalos de memória, são mantidos de maneira ordenada
* **c.** Swapping é o ato de copiar o conteúdo de um processo da memória para o disco
* **f.** Um espaço de endereçamento é o conjunto de endereços que um processo pode utilizar para escrever na memória
* **g.** A MMU é responsável por mapear endereços virtuais em endereços de memória física
* **i.** Memória virtual é uma técnica que permite a processos executarem, mesmo existindo apenas parcialmente na memória principal

> **Atenção:** A assertiva *"A MMU é um módulo que, usualmente, encontra-se dentro da CPU"* foi considerada **falsa** com base na literatura clássica adotada, que posiciona a MMU esquematicamente *entre* a CPU e a RAM.

---

## 4. Definições de Memória Virtual e Paginação

**Questão:** No contexto de Memória Virtual, relacione os termos com as suas respectivas definições.

### Mapeamento Oficial:
* **Página:** Unidade de tamanho fixo do dispositivo de armazenamento secundário.
* **Segmentação:** Técnica de memória virtual que quebra a memória em blocos que contém o mesmo tipo de informação.
* **Tabela de Páginas:** Estrutura utilizada para mapear páginas e frames.
* **MMU:** Realiza a tradução entre endereços virtuais e endereços reais.
* **Memória Virtual:** Técnica que usa a memória secundária como uma “cache” das partes dos espaços dos espaços dos processos.
* **Paginação:** Técnica de memória virtual que "quebra" a memória em blocos de tamanho fixo.
* **Translate Lookaside Buffer (TLB):** Módulo de hardware para mapear endereços físicos sem passar pela tabela de páginas.
* **Frame:** Unidade correspondente à página na memória principal.
* **Page Fault:** Evento decorrente da referência a uma página que não encontra-se na memória principal.

---

## 5. Cálculos de Endereçamento de Memória

### Problema 1: Bits de Endereçamento (MAR)
* **Enunciado:** Uma memória principal possui um espaço de endereçamento máximo de 2K. Qual a quantidade de bits utilizada para esses endereços (MAR)?
* **Resposta:** **11 bits** ($2\text{K} = 2^{11}$).

### Problema 2: Número Total de Blocos
* **Enunciado:** Uma memória principal possui tamanho máximo de 256K. Cada bloco armazena 8 bits (tamanho da palavra). Qual é o número total de blocos?
* **Resposta:** **262.144 blocos** ($256 \times 1024$).

---

## 6. Algoritmos de Substituição de Páginas

**Questão:** Relacione os algoritmos de substituição de páginas de acordo com o seu princípio de funcionamento ou uma característica chave do mesmo.

### Mapeamento Oficial:
* **Working Set:** Substitui páginas que estão fora do conjunto ativo de trabalho do processo.
* **WSClock:** Combina o concept de Working Set com o algoritmo do Relógio para maior eficiência.
* **Segunda Chance:** Verifica um bit de uso, e dá uma segunda chance às páginas antes de substituí-las, caso o bit de uso esteja marcado.
* **Not Recently Used Page Replacement (NRU):** Substitui páginas com base em bits de uso e modificação, priorizando as menos usadas recentemente.
* **Algoritmo Ótimo:** Não existe na prática, utilizado apenas para simulações e comparação.
* **Relógio:** Implementa o algoritmo de Segunda Chance com um ponteiro circular.
* **First-In, First-Out (FIFO):** Substitui a página mais antiga na memória, ou seja, aquela que chegou primeiro.
* **Least Recently Used (LRU):** Remove a página que não foi usada por mais tempo.

---

## 7. Assertivas sobre Tabela de Páginas e Paginação

**Questão:** Assinale as assertivas verdadeiras, relacionadas à Tabela de Páginas e Paginação.

### Alternativa Verdadeira (Única Aceita):
* **e.** A paginação hierárquica utiliza múltiplas tabelas de páginas

> **Atenção:** As alternativas sobre alocação fixa e a estrutura de frames na Tabela de Página Invertida foram consideradas incorretas devido a detalhes específicos e restrições presentes nos slides da disciplina.

---

## 8. Assertivas sobre Subsistema de Entrada e Saída (E/S)

**Questão:** Sobre Entrada e Saída, assinale as assertivas verdadeiras.

### Alternativas Verdadeiras (Gabarito Oficial):
* **a.** O tipo de conexão serial é mais barato e relativamente confiável
* **b.** O Software de E/S independente de dispositivo busca fornecer uma interface uniforme ao software de usuário...
* **h.** Considerando as formas de comunicação de dispositivos de E/S, na memória mapeada, registradores são mapeados no espaço de memória

---

## 9. Assertivas sobre Sistemas de Arquivos

**Questão:** Sobre os Sistemas de Arquivos, assinale as assertivas verdadeiras.

### Alternativas Verdadeiras (Gabarito Oficial):
* **a.** No Linux, o comando mv também é utilizado para renomear arquivos
* **b.** Diretório são arquivos com o propósito de facilitar a organização e estruturação dos arquivos no sistema de arquivos
* **e.** Arquivo é uma abstração do SO que cria uma organização lógica para dados, que serão utilizados como informações
* **g.** Arquivos podem ser acessados de dois modos diferentes: modo sequencial e modo aleatório
