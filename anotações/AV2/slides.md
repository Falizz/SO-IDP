# Resumão de Sistemas Operacionais — Revisão para a Prova

Este documento serve como um guia completo e estruturado com base nos materiais didáticos e gabaritos oficiais das aulas do Professor Jeremias Moreira Gomes (IDP). Focado estritamente nos tópicos essenciais de gerenciamento de memória, paginação, substituição de páginas, entrada/saída e sistemas de arquivos.

---

## 1. Gerenciamento de Memória

### O "Mundo Ideal" vs. Realidade Tecnológica
* **A Ilusão do Programador:** Em um cenário ideal, os desenvolvedores teriam à disposição uma memória infinitamente grande, extremamente rápida, não volátil (que retém dados ao desligar) e de baixíssimo custo.
* **A Realidade Física:** A tecnologia atual não consegue entregar todas essas características simultaneamente. Memórias rápidas (como registradores e caches) são pequenas e caras; memórias grandes (como HDs e SSDs) são lentas. Por isso, o Sistema Operacional (SO) precisa intervir com técnicas de gerenciamento para otimizar a RAM real.

### Funções do Gerenciador de Memória
Compete estritamente ao software de gerência de memória principal do SO:
1. Controlar quais partes da memória estão sendo utilizadas e quais estão livres.
2. Alocar blocos de memória para processos que os solicitam.
3. Liberar a memória de processos que finalizaram para reaproveitamento.

**O que NÃO compete ao gerenciador de memória principal:**
* Agilizar o acesso a dados frequentemente usados (atribuição da memória **Cache**, gerenciada por hardware).
* Controlar ou alocar a memória física/registradores de dispositivos de Entrada/Saída mapeados (atribuição do **Subsistema de E/S** e de drivers).

### Alocação Particionada e Realocação
* **Partição Fixa (Alocação Estática):** O tamanho e a quantidade das partições de memória são definidos previamente. Se um processo for menor que a partição alocada para ele, o espaço restante é totalmente desperdiçado, gerando o fenômeno da **fragmentação interna**. Portanto, a utilização da memória não é otimizada.
* **Espaço de Endereçamento:** É a abstração criada para proteger a memória, consistindo no conjunto exclusivo de endereços lógicos que um processo específico pode utilizar para ler ou escrever.
* **Realocação Estática:** Realizada pelo carregador (*loader*) antes de o programa rodar. Cada referência de memória no programa é calculada somando-se um offset ao endereço inicial, alterando fisicamente as instruções de forma permanente para aquela execução.
* **Realocação Dinâmica:** Realizada em tempo de execução via hardware, utilizando registradores **Base** e **Limite**. Cada acesso é somado dinamicamente ao registrador Base e validado contra o registrador Limite.

### Algoritmos de Gerenciamento de Memória Livre (Lista Encadeada)
Para gerenciar blocos livres e ocupados, a lista encadeada mantém os nós **ordenados pelo endereço de memória** correspondente. Isso permite que, quando um processo termine, o sistema consiga fundir nós livres vizinhos adjacentes de maneira eficiente.

| Algoritmo | Princípio de Funcionamento | Características-Chave / Desvantagens |
| :--- | :--- | :--- |
| **First Fit** | Percorre a lista a partir do início até encontrar o **primeiro espaço** grande o suficiente (capaz de conter o bloco solicitado). | É o algoritmo de menor busca (mais rápido para alocação direta). Não exige que o espaço seja estritamente igual, apenas maior ou igual. |
| **Next Fit** | Funciona igual ao First Fit, mas grava a posição onde a alocação ocorreu e realiza as **buscas seguintes a partir dessa última posição gravada**. | Embora pareça uma boa otimização, apresenta desempenho prático pior do que o First Fit na maioria dos cenários. |
| **Best Fit** | Varre a **lista inteira** e devolve o **menor espaço possível** que consiga abrigar o processo (procura a "menor sobra"). | É muito mais lento por sempre precisar varrer toda a lista. Além disso, fragmenta severamente o sistema, deixando micro-buracos de memória inutilizáveis. |
| **Worst Fit** | Varre a lista inteira e escolhe sempre o **maior espaço disponível**. | A ideia conceitual é deixar sobras grandes o suficiente para que outros processos possam reaproveitá-las futuramente, evitando microfragmentação. Usado no *ptmalloc* e *dlmalloc*. |
| **Quick Fit** | Mantém listas encadeadas separadas para os tamanhos de blocos mais comumente solicitados pelo sistema. | Alocação extremamente rápida para tamanhos padrão, mas complexo de gerenciar. |

---

## 2. Memória Virtual e Paginação

### Conceitos Fundamentais
* **Memória Virtual:** Técnica de gerência que permite a processos executarem mesmo estando apenas **parcialmente carregados na memória principal (RAM)**. Usa a memória secundária (disco) como uma extensão ou "cache" do espaço de endereçamento. Aumenta drasticamente o grau de multiprogramação.
* **Swapping:** O ato completo de copiar o conteúdo integral de um processo ocioso da memória RAM para o disco (área de swap) e trazê-lo de volta na totalidade quando for executar. Diferencia-se da paginação, que transfere pedaços de tamanho fixo.
* **Páginas (Virtuais):** Unidades de tamanho fixo em que o espaço de endereçamento lógicos/virtuais do dispositivo secundário é quebrado (geralmente potências de 2, como 4KB).
* **Frames (Molduras de Página):** Unidades correspondentes de tamanho fixo dentro da memória física (RAM).
* **MMU (Memory Management Unit):** Unidade de hardware responsável por interceptar as requisições da CPU e realizar a tradução/mapeamento de endereços virtuais em endereços reais de alocação na memória física. *Nota de prova:* Classicamente (e em livros tradicionais como Tanenbaum), é considerada um módulo intermediário posicionado entre o processador e a RAM, e não uma peça interna da CPU.

### Estrutura da Tabela de Páginas
Cada entrada da tabela de páginas (PTE) possui mapeamentos e bits de controle vitais:
* **Page Frame Number (PFN):** Identifica a localização real do correspondente frame na RAM física.
* **Bit de Residência (Presente/Ausente):** Indica se a página virtual mapeada está atualmente carregada na RAM (valor 1) ou se está ausente, no disco (valor 0).
* **Bits de Proteção:** Controlam as permissões de acesso daquela página (Leitura, Escrita, Execução — rwx).
* **Bit de Modificação (Bit Dirty / Sujo):** Indica se o conteúdo da página foi alterado desde que foi trazido do disco. Se for 1, o SO sabe que precisará escrever a página de volta no disco antes de removê-la da RAM.
* **Bit de Referenciamento:** Indica se a página foi acessada recentemente (útil para os algoritmos de substituição).

### Page Fault e o Papel da TLB
* **Page Fault (Falha de Página):** Evento decorrente da referência a uma página que não se encontra na memória principal (Bit Presente/Ausente = 0). A MMU gera uma interrupção de hardware, o processo é pausado e o SO assume o controle para buscar a página no disco.
* **TLB (Translation Lookaside Buffer):** Cache de hardware de altíssima velocidade contido na MMU que armazena as traduções de endereços virtuais mais recentes, evitando a consulta lenta à tabela de páginas principal residente na RAM.
  * **Soft Miss:** Ocorre quando a tradução da página não está na TLB, mas a página **está presente na RAM**. O hardware apenas lê a entrada na tabela da RAM e atualiza a TLB (sem acessar o disco).
  * **Hard Miss:** A página não está na TLB e **nem na memória física**. Exige a interrupção completa por Page Fault para buscar o bloco no armazenamento secundário (extremamente lento).

### Estruturas de Tabelas para Espaços Grandes
Com arquiteturas de 64 bits, tabelas lineares simples ficariam grandes demais para caber na RAM. Soluções:
* **Paginação Hierárquica:** Divide a tabela de páginas em múltiplos níveis (ex: diretório de páginas apontando para tabelas menores). A grande vantagem é que **utiliza múltiplas tabelas** menores e permite manter na RAM apenas as tabelas dos intervalos de endereços que estão sendo usados de fato pelo processo.
* **Tabela de Páginas Invertida:** Em vez de ter entradas por página virtual do processo, ela possui **entradas correspondentes aos frames reais da RAM física** (uma única tabela global para o sistema inteiro). Economiza espaço massivo na RAM, mas exige funções de busca adicionais para associar a página virtual ao frame.
* **Tabela de Páginas baseada em Hash:** Utiliza uma função de espalhamento (hash) sobre o número da página virtual para mapear de forma compacta e rápida a entrada correspondente.

### Fórmulas e Relações Matemáticas para a Prova
1. **Número Total de Blocos (Frames):**
   $$	ext{Número Total de Blocos} = rac{	ext{Tamanho Total da Memória RAM}}{	ext{Tamanho de um Bloco (Célula/Página)}}$$
   *Exemplo de cálculo:* Se a memória total da RAM é de $256	ext{ KB}$ e o tamanho do bloco/página é de $1	ext{ Byte}$, o número total de blocos será $256	ext{ K}$ ($262.144$ blocos).
2. **Número de Bits do Endereço (MAR - Memory Address Register):**
   Pegue o número total de blocos obtido e jogue na base 2 ($2^{	ext{bits}}$).
   *Exemplo:* Para endereçar uma RAM dividida em $256	ext{ K}$ blocos:
   $$256	ext{ K} = 2^8 	imes 2^{10} = 2^{18} 
ightarrow 18	ext{ bits de endereço.}$$
   *Exemplo 2:* Se o número total de blocos calculados fosse $2	ext{ K}$ blocos:
   $$2	ext{ K} = 2^{11} 
ightarrow 11	ext{ bits de endereço.}$$

---

## 3. Algoritmos de Substituição de Páginas

Quando ocorre um *page fault* e todos os frames da memória RAM física estão ocupados, o SO precisa escolher uma página "vítima" para ser removida e dar lugar à nova.

### Características Clássicas de cada Algoritmo
* **Algoritmo Ótimo:** Seleciona para remoção a página que vai demorar o **maior número de instruções/tempo para ser referenciada no futuro**. Na prática, é **impossível de ser implementado**, pois o SO não consegue prever o futuro do fluxo do programa. É utilizado estritamente para simulações e como benchmark de comparação.
* **NRU (Not Recently Used):** Coleta estatísticas de uso baseando-se nos bits **R (Referenciado)** e **M (Modificado)**. O relógio do sistema limpa periodicamente o bit R de todas as páginas para identificar o que não foi acessado recentemente. O bit M nunca é limpo pelo relógio (pois o SO precisa saber se o bloco foi alterado para salvá-lo no disco). Divide as páginas em 4 classes:
  * *Classe 0 (00):* Não referenciada, não modificada (Melhor candidata a sair).
  * *Classe 1 (01):* Não referenciada, modificada (Ocorreu quando o bit R foi limpo pelo tick do relógio).
  * *Classe 2 (10):* Referenciada, não modificada.
  * *Classe 3 (11):* Referenciada, modificada.
* **FIFO (First-In, First-Out):** Substitui a página que está há mais tempo na memória (a que chegou primeiro). Algoritmo simples, mas ineficiente. Sofre da **Anomalia de Belady** (fenômeno onde o aumento do número de frames físicos disponíveis na RAM resulta paradoxalmente no aumento do número de falhas de página para certas sequências).
* **Segunda Chance:** Uma modificação inteligente do FIFO. Examina o bit R da página mais antiga na fila. Se R for 0, a página é substituída imediatamente. Se R for 1, o bit é zerado (R=0) e a página é movida para o final da fila, recebendo uma "segunda chance".
* **Relógio (Clock):** Implementação de alta performance do algoritmo de Segunda Chance. Organiza as páginas em uma **estrutura de lista circular** e utiliza um ponteiro (semelhante à agulha de um relógio). Evita a sobrecarga pesada do algoritmo de Segunda Chance tradicional, que precisa ficar movendo páginas constantemente de posição em uma lista encadeada física. O ponteiro apenas avança rotacionando e limpando os bits R até achar um R=0.
* **LRU (Least Recently Used):** Substitui a página que está há **mais tempo sem ser referenciada no passado**. Excelente desempenho teórico aproximado ao ótimo, porém exige suporte de hardware especializado e complexo para manter o histórico exato de tempos, tornando sua implementação pura muito cara.
* **Working Set (Conjunto de Trabalho):** Baseia-se no princípio da localidade. O *Working Set* é o conjunto de páginas que um processo referenciou ativamente durante os seus últimos $t$ segundos de execução. O algoritmo remove páginas que estão **fora do conjunto ativo de trabalho**. Um processo só deve rodar se o seu working set inteiro estiver na RAM, evitando o **thrashing** (estado caótico onde o sistema passa quase 100% do tempo tratando page faults e chaveando páginas com o disco, paralisando a execução útil).
  * **Pré-paginação:** Estratégia que consiste em carregar todo o working set estimado do processo na RAM antes de reiniciar sua execução, minimizando falhas iniciais.
* **WSClock:** Combina a estrutura leve e circular do algoritmo do **Relógio (Clock)** com a lógica de validação de tempo do **Working Set**. É amplamente utilizado nos sistemas operacionais reais modernos devido à sua extrema simplicidade e excelente performance.

---

## 4. Subsistema de Entrada e Saída (E/S)

### Classificação de Dispositivos de E/S
Os dispositivos físicos de hardware são avaliados e classificados sob duas óticas principais:

#### 1. Por Tipo de Conexão e Meio Físico
* **Serial:** Envia ou recebe os dados **um bit por vez**, sequencialmente, através de um único condutor (ex: mouses, conexões de rede legadas). Apresenta menor custo de fabricação e é relativamente confiável em longas distâncias.
* **Paralela:** Envia **múltiplos bits simultaneamente** através de múltiplos fios condutores paralelos (ex: barramentos antigos de impressoras, cabos IDE). Permite taxas de transferência altas a curtíssimas distâncias, mas sofre com interferência eletromagnética se o cabo for longo.
* **Ponto-a-Ponto:** Conexão simples que estabelece uma linha dedicada e exclusiva de ligação física entre o módulo controlador e o periférico. Oferece alta confiabilidade e fornece **paralelismo real** de hardware.
* **Multiponto:** Estabelece um barramento onde um conjunto compartilhado de linhas é utilizado por múltiplos dispositivos conectados simultaneamente. Fornece alta escalabilidade ao sistema, mas **não permite paralelismo simultâneo** na mesma linha de transmissão (exige arbitragem e compartilhamento do canal, muito comum em armazenamento).

#### 2. Por Tipo de Transferência de Dados
* **Dispositivos de Bloco:** Armazenam e gerenciam informações estruturadas em **blocos de tamanho fixo**. Cada bloco possui o seu próprio **endereço físico exclusivo**, o que possibilita ao sistema ler ou escrever em qualquer bloco de forma totalmente independente e aleatória (ex: Discos Rígidos - HDs, SSDs, Pendrives).
* **Dispositivos de Caractere:** Enviam ou aceitam um fluxo contínuo e linear de caracteres individuais. **Não são estruturados em blocos e não possuem endereçamento**, impossibilitando qualquer operação de busca direta ou salto (ex: Teclados, mouses, impressoras).

### Princípios de Hardware de E/S
* **Componente Mecânico:** É o dispositivo físico palpável em si (o motor do HD, a bandeja do CD, as teclas).
* **Componente Eletrônico:** É a **controladora do dispositivo** (placa de circuito, chip embutido). Ela possui uma parte programável contendo **registradores de controle e buffers de dados** internos. A CPU se comunica exclusivamente com a controladora e não com a parte mecânica.
* **Comunicação por Memória Mapeada (*Memory-Mapped I/O*):** Técnica onde os registradores internos da controladora de E/S são mapeados diretamente no mesmo espaço lógico de endereçamento de memória RAM da CPU. A CPU lê/escreve nos registradores usando instruções normais de acesso à memória.

### Técnicas e Modos de Operação de E/S
* **E/S Programada (Espera Ocupada / Polling):** A CPU emite o comando para a controladora e entra em um laço de repetição (*loop*) contínuo testando o registrador de status até que o dispositivo termine a operação. A **CPU participa de 100% do processo**, desperdiçando ciclos massivos de processamento em espera cega.
* **Modo Controlado por Interrupções:** Resolve o desperdício da espera ocupada. A CPU envia o comando para a controladora e imediatamente passa a executar outras tarefas/processos úteis. Quando os dados estão prontos no buffer da controladora, ela gera um sinal de **interrupção de hardware** direcionado à CPU. A CPU intercepta o sinal, suspende temporariamente o trabalho atual e realiza a leitura.
  * *Nota de prioridade:* Interrupções são numeradas; linhas com menor número possuem prioridade estrita de atendimento sobre números maiores. A CPU ainda participa ativamente copiando os dados da controladora para a RAM.
* **DMA (Direct Memory Access):** Chip de hardware especializado que assume o controle da transferência de blocos completos de dados **diretamente entre o buffer da controladora do dispositivo e a memória RAM**, sem que a CPU precise intervir na cópia byte a byte. A CPU configura o DMA informando o endereço de origem, destino e tamanho, e volta a processar. Ao término do bloco inteiro, o DMA gera uma única interrupção final avisando a CPU. Reduz drasticamente a sobrecarga do processador.

### Princípios de Software de E/S (Estrutura em Camadas)
* **Objetivo de Alto Nível:** Fornecer **independência de dispositivos**. Uma mesma chamada de sistema executada pelo usuário (como a instrução `read()`) precisa servir uniformemente para ler dados de um disco rígido ou de um pendrive, ocultando as especificidades físicas.
* **Drivers de Dispositivo:** Códigos de software específicos para cada periférico encarregados de traduzir os comandos abstratos do SO em comandos interpretáveis pela controladora. Os drivers e os tratadores de interrupção executam obrigatoriamente no **Modo Núcleo (Modo Kernel / Supervisor)** do processador para terem acesso direto ao hardware.
* **Software de E/S Independente de Dispositivo:** Camada superior que fornece uma interface uniforme para o software de usuário, evitando que o SO precise ser modificado ou recompilado a cada novo dispositivo de hardware criado pelo mercado.

---

## 5. Sistemas de Arquivos

### Abstrações Principais
* **Arquivo:** Uma abstração criada pelo SO para ocultar as particularidades físicas dos setores de armazenamento. Consiste em uma unidade de organização lógica para dados nomeados e **persistentes** na mídia (não são afetados pelo término ou encerramento dos processos).
* **Diretório:** São **arquivos especiais** cujo conteúdo exclusivo estruturado internamente é uma lista contendo nomes de arquivos, metadados e seus respectivos mapeamentos físicos/lógicos. Servem exclusivamente para prover organização estrutural lógica ao sistema de arquivos.

### Modos de Acesso e Tipos de Arquivos
* **Modos de Acesso:**
  * **Modo Sequencial:** Os dados (bytes ou registros) precisam ser lidos ou gravados estritamente um após o outro, na ordem física em que foram armazenados.
  * **Modo Aleatório (Acesso Direto):** Permite ler ou gravar saltando diretamente para qualquer byte ou posição específica do arquivo de forma instantânea, utilizando operações de posicionamento como o `seek()`.
* **Tipos de Arquivos Regulares:**
  * **ASCII:** Arquivos compostos de texto simples formatados em linhas inteligíveis finalizadas com caracteres de controle (CR+LF ou LF). Altamente portáteis e interoperáveis entre diferentes sistemas.
  * **Binário:** Sequências brutas de bytes não ASCII que não seguem formatação de texto. Sua estrutura interna é **normalmente conhecida apenas pelo programa ou desenvolvedor que o criou/utiliza**. Para que o arquivo faça sentido, a aplicação precisa mapear seus campos previamente.

### Nomes de Arquivos, Caminhos e Comandos
* **Nomes:** Suportam até 255 caracteres na maioria dos sistemas atuais. Caracteres proibidos padrão incluem símbolos reservados de barramento e caminhos: `?, *, /, \, ", |, <, >, :`.
* **Caminho Absoluto:** Caminho completo de localização de um arquivo montado e referenciado **sempre a partir do diretório raiz do sistema** (representado por `/` no Linux/Unix ou `C:\` no Windows). Exemplo: `/usr/bin/python`.
* **Caminho Relativo:** Caminho de localização calculado e montado **a partir do diretório atual de trabalho** em que o processo se encontra. Utiliza o símbolo `./`. Exemplo: `./programa`.
* **Comando Terminal Terminal (Linux):** O comando `mv` (move) possui dupla função nativa no Linux/Unix, servindo tanto para mover um arquivo fisicamente entre diretórios diferentes quanto para alterar o seu nome dentro do mesmo diretório (**renomear**).

### Links (Atalhos)
* **Hard Link (Link Rígido):** Cria uma nova entrada de diretório apontando diretamente para o mesmo nó físico de identificação original do arquivo (**I-node**).
  * Incrementa um contador interno de links contido no arquivo.
  * O arquivo físico e seus dados só serão efetivamente removidos e desalocados do disco se o **contador de links chegar estritamente a zero** (via comando `unlink` ou remoção de todas as referências).
* **Soft Link / Symbolic Link (Link Simbólico):** É um arquivo especial e totalmente separado que contém apenas um ponteiro de texto puro armazenando o caminho para o arquivo original.
  * **Vantagens:** Não exige a cópia dos dados, mantendo total coesão e facilidade de criação entre diferentes partições e discos.
  * **Desvantagens:** Os links simbólicos podem ser perdidos facilmente. Se o arquivo original de destino for excluído ou movido, o Soft Link continua existindo no diretório, mas torna-se um **link órfão/quebrado**, apontando para o vazio.

### Modelos de Implementação de Sistemas de Arquivos

#### 1. Alocação Contígua
* Armazena cada arquivo em um conjunto de blocos físicos consecutivos e sequenciais no disco.
* **Vantagens:** Desempenho de leitura sequencial imbatível (a cabeça do disco não precisa se mover). Muito utilizado em mídias ópticas de leitura como CDs e DVDs (onde o protocolo UDF clássico limitava os arquivos a no máximo 1GB devido ao uso de endereçamento de 30 bits; Blu-Rays corrigiram isso usando 64 bits).
* **Desvantagens:** Sofre com fragmentação externa severa à medida que arquivos são deletados e criados, e torna extremamente difícil e custoso o crescimento de tamanho de um arquivo já gravado.

#### 2. Alocação por Lista Encadeada
* Cada bloco do disco possui uma palavra reservada no seu início contendo um ponteiro que indica o endereço físico do próximo bloco do arquivo no disco.
* **Vantagens:** Não há perda de espaço por fragmentação externa; arquivos podem crescer livremente ocupando qualquer bloco solto.
* **Desvantagens:** O acesso aleatório é extremamente lento (para ler o bloco 50, é preciso ler obrigatoriamente os 49 blocos anteriores em disco para seguir a trilha de ponteiros). Além disso, perde-se a vantagem do alinhamento ideal de potências de 2 para armazenamento de dados no bloco, pois alguns bytes internos são roubados para guardar o ponteiro.

#### 3. Lista Encadeada com Tabela na Memória (FAT - File Allocation Table)
* Retira os ponteiros de dentro dos blocos físicos do disco e agrupa todos eles em uma tabela centralizada mapeada na memória principal (RAM), batizada de **FAT**. O bloco de disco agora fica 100% livre para dados, mantendo potências de 2.
* **Desvantagem Crítica:** A tabela FAT **precisa estar integralmente carregada na memória RAM o tempo todo** enquanto o sistema estiver ligado.
  * *Exemplo de inviabilidade em discos grandes:* Se um disco rígido moderno possui $1	ext{ TB}$ de capacidade e o tamanho do bloco adotado é de $1	ext{ KB}$, o disco terá $1	ext{ Bilhão}$ de blocos. Utilizando entradas compactas de tabela de 4 bytes para cada bloco, seriam necessários **3 GB de memória RAM física consumidos exclusivamente para manter a tabela FAT na memória**, tornando o modelo totalmente imprático para mídias grandes.

#### 4. Nós de Índice (I-nodes)
* Associa cada arquivo a uma estrutura de dados compacta e individual chamada **I-node**. O I-node armazena todos os atributos e metadados do arquivo (dono, grupo, permissões rwx, tamanho, timestamps, número de hard links) junto com um conjunto de ponteiros de endereços diretos e indiretos para os blocos de dados no disco.
* **Grande Vantagem sobre a FAT:** Os I-nodes residem originalmente e de forma persistente no disco físico. Eles **só são trazidos para a memória principal (RAM) quando os arquivos correspondentes estão abertos** ou sendo ativamente manipulados pelo sistema operacional, economizando gigabytes de memória.

### Consistência e Tolerância a Falhas em Sistemas de Arquivos
* **Sistemas Estruturados em Logs:** Técnica que armazena todas as operações de escrita pendentes primeiramente em uma fila na memória RAM de forma agrupada. Periodicamente, grava tudo de uma única vez no disco em um único segmento sequencial contínuo contendo logs explicativos. Oferece altíssimo desempenho de escrita, mas exige um processo constante de limpeza (*garbage collector*) e sofre quedas bruscas de performance quando o disco se aproxima da capacidade total.
* **Sistemas com Journaling (Jornalamento):** Criado para solucionar problemas de corrupção estrutural causados por falhas súbitas ou quedas de energia. Baseia-se em conceitos de transações de bancos de dados. Antes de realizar qualquer alteração estrutural no sistema de arquivos, o SO registra a intenção detalhada em um diário protegido no disco (o jornal). Na ocorrência de uma queda de energia, o SO lê o diário durante a inicialização e consegue concluir o trabalho pendente ou cancelá-lo perfeitamente, garantindo **recuperação rápida de falhas sem inconsistências**.
  * **Modo Write-Behind:** Jornaliza **apenas os metadados** (as estruturas organizacionais). Fornece excelente velocidade, garante a consistência estrutural do sistema, mas as operações recentes de dados dentro dos arquivos podem ser perdidas ou conter "lixo". Adotado no NTFS, ext3, ext4.
  * **Modo Ordered Data:** Jornaliza os metadados, mas obriga o sistema a **escrever os blocos de dados reais no local definitivo do disco antes de realizar o commit** final nos metadados do diário. Evita que novos arquivos fiquem preenchidos com lixo residual do disco.

### Tabela Comparativa de Sistemas de Arquivos Atuais

| Sistema de Arquivos | SO Principal | Estrutura Base | Principais Vantagens | Desvantagens / Limitações | Uso Atual Comum |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **NTFS** | Windows | MFT (Master File Table) | Suporta Journaling nativo, arquivos e partições gigantes, segurança avançada. | Estrutura altamente complexa e proprietária. | Padrão absoluto no Windows 10, Windows Server. |
| **ext4** | Linux | I-nodes | Extremamente estável, rápido, maduro e leve. | Não possui suporte nativo integrado a snapshots. | Padrão no Ubuntu, Debian, Fedora, WSL. |
| **ZFS** | Linux / BSD | Copy-on-Write (CoW) | Integridade de dados máxima auto-corretiva, suporte nativo a RAID e snapshots. | Consome volumes massivos de memória RAM. | Servidores de arquivos de alta confiabilidade e NAS. |
| **APFS** | macOS / iOS | Copy-on-Write (CoW) | Altamente otimizado para SSDs, criptografia forte nativa e snapshots rápidos. | Código proprietário restrito ao ecossistema Apple. | iPhones, iPads e Macs modernos. |
| **FAT32** | Universal | Tabela FAT | Compatibilidade universal e absoluta com quase qualquer dispositivo ou SO do mercado. | **Não possui Journaling** (sujeito a corrupções fáceis) e limita arquivos a no máximo **4 GB** de tamanho. | Pendrives antigos, cartões SD legados e sistemas embarcados. |
| **exFAT** | Universal | Tabela FAT Evoluída | Mantém a alta compatibilidade eliminando o limite de 4GB (aceita arquivos gigantes). | Continua sem suporte a Journaling nativo. | Pendrives modernos, cartões SD de alta capacidade (SDXC). |

---