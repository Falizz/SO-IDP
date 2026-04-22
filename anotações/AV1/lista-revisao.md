# Estudo Dirigido: Arquitetura de Computadores e Sistemas Operacionais

## 1. Fundamentos de Hardware e Processamento

### Verdadeiro ou Falso: Assertivas de Hardware

* **Pipeline:** Técnica de hardware para busca de uma ou mais instruções além da próxima a ser executada, ao mesmo tempo. (**Verdadeiro**)
* **Conjunto de Instruções:** Cada processador possui um conjunto específico de instruções (ISA). (**Verdadeiro**)
* **Multiprogramação:** Capacidade do SO de executar concorrentemente vários processos, alternando-os entre CPU e memória. (**Verdadeiro**)
* **Hierarquia de Memória:** Estrutura utilizada para tentar melhorar a velocidade de provisão de dados para o processador. (**Verdadeiro**)
* **Processador Superescalar:** Aquele que possui unidades múltiplas de execução. (**Verdadeiro**)
* **Cache:** Tipo de memória controlada pelo hardware. (**Verdadeiro**)
* **Interrupção:** Evento externo que causa o processador parar a execução do programa corrente e desviar para uma rotina de interrupção. (**Verdadeiro**)
* **Memória Virtual:** Técnica para executar programas que são maiores do que a memória principal disponível. (**Verdadeiro**)
* **Linhas de Endereço:** Indicam o local de leitura/escrita (não controlam o acesso; quem controla são as linhas de controle). (**Falso**)
* **Modo Usuário:** Todos os recursos estão disponíveis. (**Falso** - Apenas no Modo Kernel).

### Estrutura de um Barramento

* **Definem origem e destino dos dados:** Linhas de Endereços
* **Onde os dados são trafegados entre dispositivos:** Linhas de Dados
* **Controla o acesso das linhas de dados e endereços:** Linhas de Controle

### O Ciclo de Instrução

As três fases fundamentais são:

1. **Unidade de Busca (Fetch)**
2. **Unidade de Decodificação (Decode)**
3. **Unidade de Execução (Execute)**

---

## 2. Sistemas Operacionais: Conceitos e Estruturas

### Funções do Sistema Operacional

* **Gerenciador de Recursos:** Focado em controlar o funcionamento do computador, gerenciar recursos e maximizar a utilização do hardware.
* **Máquina Estendida (Abstração):** Focado na facilidade de uso, interface amigável e em omitir detalhes complexos de funcionamento do hardware.

### Classificação de Sistemas Operacionais

* **Computadores Pessoais:** Apoio ao usuário comum.
* **Computadores Portáteis:** Android (Google) e iOS (Apple).
* **Multiprocessadores:** Múltiplas CPUs em um único SO.
* **Grande Porte (Mainframes):** Grande capacidade de Entrada e Saída.
* **Cartões Inteligentes:** Funcionamento via energia por indução.
* **Tempo Real:** Controle de processos industriais.
* **Embarcados:** Computadores que controlam outros dispositivos.
* **Servidores:** Compartilhamento de recursos em rede.
* **Nós Sensores:** Dispositivos com baixo consumo de energia.

### Estruturas de Projeto do SO

* **Sistemas Monolíticos:** O sistema é executado como um único programa em modo núcleo.
* **Sistemas de Camadas:** Organização em "castas" (camadas de abstração).
* **Microkernel:** Divisão do sistema em pequenos módulos bem definidos (serviços no espaço do usuário).
* **Modelo Cliente-Servidor:** Comunicação baseada em troca de mensagens.
* **Exokernel:** Divisão de recursos com multiplexação segura do hardware.
* **Máquinas Virtuais:** Cópias do hardware para simular ambientes computacionais.

---

## 3. Programação Assembly (x86-64) e Memória

### Registradores e seus Propósitos

* **RAX:** Utilizado para retorno de funções.
* **RIP:** Apontador de Instrução (Instruction Pointer).
* **RCX:** Convencionado para contadores.
* **RSP:** Registrador de Pilha (Stack Pointer).
* **RBP:** Registrador de Base da Pilha (Base Pointer).
* **R8:** Registrador de Propósito Geral.

### Convenção de Tamanhos

* **4 bits:** NIBBLE
* **8 bits:** BYTE
* **16 bits:** WORD
* **32 bits:** DWORD
* **64 bits:** QWORD

### Chamadas de Sistema (Syscalls) no Linux x64

* **Instrução:** `syscall`.
* **Identificador:** O número da syscall deve ser colocado no registrador **RAX**.
* **Ordem dos Parâmetros:** RDI, RSI, RDX, **R10**, R8, R9.
* **Retorno:** O valor resultante da chamada fica no **RAX**.
* **Seções de Memória:**
  * `.text`: Contém o código executável.
  * `.data`: Contém variáveis globais inicializadas.
  * `.bss`: Contém variáveis globais não inicializadas.

---

## 4. Memória Cache e Performance

### Conceitos de Cache

* **Hit:** Dado encontrado no nível de memória procurado.
* **Miss:** Dado não encontrado.
* **Hit-rate:** Razão de hits pelo total de acessos.
* **Miss-rate:** ($1 - \text{Hit-rate}$).
* **Miss-penalty:** Custo de tempo para buscar o dado no nível inferior após um miss.
* **Bloco:** Unidade mínima de transferência entre níveis.

### Princípios de Localidade

* **Localidade Temporal:** Se um dado foi acessado, há grandes chances de ser acessado novamente em breve (ex: loops).
* **Localidade Espacial:** Se um dado foi acessado, há grandes chances de endereços vizinhos serem acessados (ex: arrays).

### Cálculos de AMAT (Average Memory Access Time)

**Problema 1:**
* Acessos de memória: 280
* Hits: 250 | Misses: 30
* Ciclos Cache: 4 | Ciclos RAM: 32
$$AMAT = \frac{(250 \times 4) + (30 \times 32)}{280} = \frac{1000 + 960}{280} = 7,0$$
**Resposta: 7,0 ciclos**

**Problema 2:**
* Acessos de memória: 4200
* Hits: 2240 | Misses: 1960
* Ciclos Cache: 3 | Ciclos RAM: 128
$$AMAT = \frac{(2240 \times 3) + (1960 \times 128)}{4200} = \frac{6720 + 250880}{4200} \approx 61,3$$
**Resposta: 61,3 ciclos**
