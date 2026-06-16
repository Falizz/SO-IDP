# Documentação Técnica: Algoritmo de Substituição de Páginas NRU (Not Recently Used)

## 1. Introdução e Contexto
Em sistemas de computação com suporte a **Memória Virtual Paginada**, a memória RAM física é limitada. Quando a memória principal fica cheia e um processo solicita uma página que está no armazenamento secundário (disco), ocorre uma *falta de página* (*page fault*). 

O Sistema Operacional deve, então, escolher uma página residente na RAM para ser removida (desalocada) e dar lugar à nova página. O algoritmo **NRU (Não Utilizada Recentemente)** é uma solução de baixa sobrecarga (*overhead*) projetada para tomar essa decisão com base no histórico recente de acessos e modificações.

---

### 2. Mecanismo de Funcionamento: Os Bits R e M
Para monitorizar o comportamento das páginas, o hardware ou o sistema operacional associa **dois bits de estado** a cada entrada da Tabela de Páginas:

* **Bit R (Referenced / Referenciada):** É definido como `1` pelo hardware sempre que a página é lida ou escrita. 
* **Bit M (Modified / Modificada / Dirty):** É definido como `1` pelo hardware sempre que a página sofre uma operação de escrita (o seu conteúdo foi alterado).

#### O Reset Periódico
O coração do "recém" no NRU depende de um temporizador do sistema (interrupção de relógio). Periodicamente (por exemplo, a cada $k$ milissegundos), o Sistema Operacional **limpa o bit R (define para 0)** de todas as páginas. Isso garante que o bit R represente apenas o histórico de acessos do ciclo de tempo mais recente. O bit M **não** é limpo pelo relógio, pois indica se a página precisa ser salva de volta no disco antes de ser removida.

---

### 3. As Quatro Classes do NRU
Quando ocorre um *page fault*, o algoritmo analisa o estado atual de (R, M) de todas as páginas residentes e classifica-as em quatro categorias hierárquicas (da menor prioridade de retenção para a maior):

| Classe | Bit R | Bit M | Descrição do Estado da Página |
| :---: | :---: | :---: | :--- |
| **Classe 0** |   0   |   0   | **Não referenciada, não modificada.** A melhor candidata para